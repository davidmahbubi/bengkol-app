import 'package:bengkol_app/src/models/kendaraan/motor_gigi.dart';
import 'package:bengkol_app/src/models/order/riwayat_order.dart';
import 'package:bengkol_app/src/models/services/service_motor_gigi.dart';
import 'package:bengkol_app/src/models/services/service_motor_matic.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MotorcycleService extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MotorcycleServiceState();
  }
}

class MotorcycleServiceState extends State<MotorcycleService> {

  String? jenisTransmisi = 'Automatic';

  ServiceMotorGigi motorGigiService = ServiceMotorGigi(null);
  ServiceMotorMatic motorMaticService = ServiceMotorMatic(null);

  TextEditingController nomorPlatInputController = TextEditingController();

  Map motorcycleServices = {
    'manual': [
      ['Servis Injeksi', 'Delivery', 'Rp. 50,000', 'service_injeksi_manual'],
      ['Servis Gigi', 'On Site', 'Rp. 10,000', 'service_gigi_manual'],
      ['Servis Rantai', 'Delivery', 'Rp. 35,000', 'service_rantai_manual'],
    ],
    'automatic': [
      ['Servis Injeksi', 'Delivery', 'Rp. 50,000', 'service_injeksi_matic'],
      ['Servis CVT', 'Delivery', 'Rp. 10,000', 'service_cvt_matic'],
      ['Servis V-Belt', 'Delivery', 'Rp. 35,000', 'service_vbelt_matic'],
    ]
  };

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Servis Sepeda Motor'),
      ),
      body: ListView(
        children: [
          Icon(
            Icons.motorcycle,
            size: 150,
          ),
          Align(
            alignment: Alignment.center,
            child: Text('Pilih Layanan Servis',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
          Form(
              child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: InputDecorator(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    borderRadius: BorderRadius.circular(10),
                                    value: jenisTransmisi,
                                    hint: Text('Tipe Motor'),
                                    isExpanded: true,
                                    items: [
                                      'Automatic',
                                      'Manual',
                                    ].map((e) {
                                      return DropdownMenuItem<String>(
                                          value: e, child: Text(e));
                                    }).toList(),
                                    onChanged: (String? item) {
                                      setState(() {
                                        jenisTransmisi = item;
                                      });
                                    }))),
                      ),
                      ...motorcycleServices[jenisTransmisi == 'Automatic' ? 'automatic' : 'manual'].map((val) {
                        return Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.15),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                  offset: Offset(0, 3))
                            ]
                          ),
                          margin: EdgeInsets.only(top: 20),
                          child: InkWell(
                              onTap: () {
                                Alert(
                                    context: context,
                                    title: val[0],
                                    content: Column(
                                      children: <Widget>[
                                        TextField(
                                          controller: nomorPlatInputController,
                                          decoration: InputDecoration(
                                            icon: Icon(Icons.star),
                                            labelText: 'Plat Nomor',
                                          ),
                                        ),
                                      ],
                                    ),
                                    buttons: [
                                      DialogButton(
                                        onPressed: () {
                                          if (jenisTransmisi == 'Automatic') {
                                            motorMaticService.nomorPlat = nomorPlatInputController.text;
                                          } else {
                                            motorGigiService.nomorPlat = nomorPlatInputController.text;
                                          }
                                          switch (val[3]) {
                                            case 'service_injeksi_manual':
                                                motorGigiService.servisInjeksi(RiwayatOrder.getLatestIndex());
                                            break;
                                            case 'service_gigi_manual':
                                                motorGigiService.servisGigi(RiwayatOrder.getLatestIndex());
                                            break;
                                            case 'service_rantai_manual':
                                                motorGigiService.servisRantai(RiwayatOrder.getLatestIndex());
                                            break;
                                            case 'service_injeksi_matic':
                                                motorMaticService.servisInjeksi(RiwayatOrder.getLatestIndex());
                                            break;
                                            case 'service_cvt_matic':
                                                motorMaticService.servisCvt(RiwayatOrder.getLatestIndex());
                                            break;
                                            case 'service_vbelt_matic':
                                                motorMaticService.servisVbelt(RiwayatOrder.getLatestIndex());
                                            break;
                                          }
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Order",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      )
                                    ]).show();
                              },
                              child: Row(
                                children: [
                                  Column(
                                    children: [Icon(Icons.settings, size: 40)],
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(val[0],
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ),
                                          ),
                                          Container(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(val[1],
                                                  style:
                                                      TextStyle(fontSize: 15)),
                                            ),
                                          ),
                                          Container(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(val[2], style: TextStyle(fontSize: 15)),
                                            ),
                                          )
                                        ],
                                      )
                                  )
                                ],
                              )
                            )
                        );
                      }).toList(),
                  ],
                ))
            )
        ],
      ),
    );
  }
}
