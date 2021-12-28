import 'dart:async';

import 'package:bengkol_app/src/models/order/riwayat_order.dart';
import 'package:bengkol_app/src/models/services/layanan.dart';
import 'package:bengkol_app/src/models/services/service_mobil_matic.dart';
import 'package:bengkol_app/src/models/services/service_motor.dart';
import 'package:bengkol_app/src/models/services/service_motor_matic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class EmergencyServicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmergencyServiceState();
  }
}

class EmergencyServiceState extends State<EmergencyServicePage> {
  late GetStorage box;

  List<String> vehicleList = ['Mobil', 'Motor', 'Truck', 'Bus', 'Minibus'];
  String? selectedVehicle = 'motor';
  TextEditingController platNomorInputController = TextEditingController();

  List<String> loadingStatus = [
    'Mendapatkan Lokasi',
    'Mencari Bengkel Terdekat',
    'Menghubungi Bengkel Terdekat'
  ];

  ServiceState() {
    box = GetStorage();
  }

  List servicesList = [
    [FaIcon(FontAwesomeIcons.tools), 'Kompa Ban'],
    [FaIcon(FontAwesomeIcons.tools), 'Tambal Ban'],
    [FaIcon(FontAwesomeIcons.oilCan), 'Ganti Oli / Pelumas'],
    [FaIcon(FontAwesomeIcons.gasPump), 'Isi Bahan Bakar']
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Layanan Instant'),
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: SvgPicture.asset('assets/images/service_head_icon.svg',
                  height: 200)),
          Container(
              margin: EdgeInsets.only(top: 20),
              child: Scrollbar(
                thickness: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: servicesList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 4.0,
                                  mainAxisSpacing: 4.0),
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              elevation: 0.2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: InkWell(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    servicesList[index][0],
                                    SizedBox(height: 20),
                                    Text(
                                      '${servicesList[index][1]}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black87),
                                    )
                                  ],
                                ),
                                onTap: () {
                                  Alert(
                                      context: context,
                                      title: servicesList[index][1],
                                      content: Column(
                                        children: <Widget>[
                                          Container(
                                            width: double.infinity,
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10),
                                                  child: InputChip(
                                                    selected: selectedVehicle ==
                                                        'motor',
                                                    avatar:
                                                        Icon(Icons.motorcycle),
                                                    label: Text('Motor'),
                                                    onSelected: (bool value) {
                                                      setState(() {
                                                        if (value) {
                                                          selectedVehicle =
                                                              'motor';
                                                        }
                                                      });
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10),
                                                  child: InputChip(
                                                    selected: selectedVehicle ==
                                                        'mobil',
                                                    avatar:
                                                        Icon(Icons.car_repair),
                                                    label: Text('Mobil'),
                                                    onSelected: (bool value) {
                                                      setState(() {
                                                        if (value) {
                                                          selectedVehicle =
                                                              'mobil';
                                                        }
                                                      });
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          TextField(
                                            controller:
                                                platNomorInputController,
                                            decoration: InputDecoration(
                                                labelText: 'Plat Nomor',
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 0)),
                                          ),
                                        ],
                                      ),
                                      buttons: [
                                        DialogButton(
                                          onPressed: () {
                                            setDialogAlert(
                                                context, loadingStatus[0]);
                                            Timer(Duration(seconds: 3), () {
                                              Navigator.pop(context);
                                              setDialogAlert(
                                                  context, loadingStatus[1]);
                                              Timer(Duration(seconds: 3), () {
                                                Navigator.pop(context);
                                                setDialogAlert(
                                                    context, loadingStatus[2]);
                                                Timer(Duration(seconds: 3), () {
                                                  Navigator.pop(context);
                                                  Alert(
                                                    context: context,
                                                    type: AlertType.success,
                                                    title:
                                                        "Bengkel Ditemukan !",
                                                    desc:
                                                        "Jarak menuju bengkel sekitar 800m",
                                                    buttons: [
                                                      DialogButton(
                                                        child: Text(
                                                          "Setuju",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          Navigator.pop(
                                                              context);

                                                          // Implement service status OOP
                                                          if (selectedVehicle ==
                                                              'motor') {
                                                            ServiceMotorMatic(
                                                                    platNomorInputController
                                                                        .text)
                                                                .kompaBan(
                                                                    RiwayatOrder
                                                                        .getLatestIndex());
                                                          } else {
                                                            ServiceMobilMatic(
                                                                    platNomorInputController
                                                                        .text)
                                                                .kompaBan(
                                                                    RiwayatOrder
                                                                        .getLatestIndex());
                                                          }

                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(SnackBar(
                                                                  content: Text(
                                                                      'Bengkel berhasil terkonfirmasi, silahkan menunggu hingga bengkel datang')));
                                                        },
                                                        color: Color.fromRGBO(
                                                            0, 179, 134, 1.0),
                                                      ),
                                                      DialogButton(
                                                        child: Text(
                                                          "Cari Lagi",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20),
                                                        ),
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        color: Colors.red,
                                                      ),
                                                    ],
                                                  ).show();
                                                });
                                              });
                                            });
                                          },
                                          child: Text(
                                            "Cari Bengkel",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        )
                                      ]).show();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  void setDialogAlert(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(message),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
