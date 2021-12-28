import 'package:bengkol_app/src/models/kendaraan/mobil_matic.dart';
import 'package:bengkol_app/src/models/order/riwayat_order.dart';
import 'package:bengkol_app/src/models/services/service_mobil_gigi.dart';
import 'package:bengkol_app/src/models/services/service_mobil_matic.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CarService extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CarServiceState();
  }
}

class CarServiceState extends State<CarService> {
  String? jenisTransmisi = 'Manual';
  TextEditingController nomorPlatInputController = TextEditingController();

  ServiceMobilMatic mobilMaticService = ServiceMobilMatic(null);
  ServiceMobilGigi mobilGigiService = ServiceMobilGigi(null);

  Map carServices = {
    'manual': [
      [
        'Servis Transmisi',
        'Delivery',
        'Rp. 200,000',
        'service_transmisi_manual'
      ],
      [
        'Servis Shift Fork',
        'On Site',
        'Rp. 200,000',
        'service_shift_fork_manual'
      ],
      [
        'Servis Kampas Kopling',
        'Delivery',
        'Rp. 150,000',
        'service_kampas_kopling_manual'
      ],
    ],
    'automatic': [
      ['Servis Roler', 'Delivery', 'Rp. 100,000', 'service_roler_matic'],
      ['Servis V-Belt', 'Delivery', 'Rp. 150,000', 'service_vbelt_matic'],
      [
        'Servis Kampas Kopling',
        'Delivery',
        'Rp. 150,000',
        'service_kampas_kopling_matic'
      ],
    ]
  };

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Servis Mobil'),
      ),
      body: ListView(
        children: [
          const Icon(
            Icons.car_repair,
            size: 150,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Pilih Layanan Servis',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
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
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(10),
                          value: jenisTransmisi,
                          hint: Text('Tipe Transmisi Mobil'),
                          isExpanded: true,
                          items: [
                            'Automatic',
                            'Manual',
                          ].map((e) {
                            return DropdownMenuItem<String>(
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                          onChanged: (String? item) {
                            setState(() {
                              jenisTransmisi = item;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  ...carServices[jenisTransmisi == 'Automatic'
                          ? 'automatic'
                          : 'manual']
                      .map((val) {
                    print(val);
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
                        ],
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
                                    mobilMaticService.nomorPlat =
                                        nomorPlatInputController.text;
                                  } else {
                                    mobilGigiService.nomorPlat =
                                        nomorPlatInputController.text;
                                  }
                                  switch (val[3]) {
                                    case 'service_transmisi_manual':
                                      mobilGigiService.servisTransmisi(
                                          RiwayatOrder.getLatestIndex());
                                      break;
                                    case 'service_shift_fork_manual':
                                      mobilGigiService.servisShiftFork(
                                          RiwayatOrder.getLatestIndex());
                                      break;
                                    case 'service_kampas_kopling_manual':
                                      mobilGigiService.servisKampasKopling(
                                          RiwayatOrder.getLatestIndex());
                                      break;
                                    case 'service_roler_matic':
                                      mobilMaticService.servisRoler(
                                          RiwayatOrder.getLatestIndex());
                                      break;
                                    case 'service_vbelt_matic':
                                      mobilMaticService.servisVBelt(
                                          RiwayatOrder.getLatestIndex());
                                      break;
                                    case 'service_kampas_kopling_matic':
                                      mobilMaticService.servisKampasKopling(
                                          RiwayatOrder.getLatestIndex());
                                      break;
                                  }
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Order",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              )
                            ],
                          ).show();
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        val[0],
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        val[1],
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        val[2],
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
