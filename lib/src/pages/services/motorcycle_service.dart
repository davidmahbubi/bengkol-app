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
  String? jenisMotor = 'Motor Matic';

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
                                    value: jenisMotor,
                                    hint: Text('Tipe Motor'),
                                    isExpanded: true,
                                    items: [
                                      'Motor Matic',
                                      'Motor Bebek',
                                      'Motor Sport'
                                    ].map((e) {
                                      return DropdownMenuItem<String>(
                                          value: e, child: Text(e));
                                    }).toList(),
                                    onChanged: (String? item) {
                                      setState(() {
                                        jenisMotor = item;
                                      });
                                    }))),
                      ),
                      Container(
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
                              ]),
                          margin: EdgeInsets.only(top: 20),
                          child: InkWell(
                              onTap: () {
                                Alert(
                                    context: context,
                                    title: "Servis Mesin Ringan",
                                    content: Column(
                                      children: <Widget>[
                                        TextField(
                                          decoration: InputDecoration(
                                            icon: Icon(Icons.star),
                                            labelText: 'Plat Nomor',
                                          ),
                                        ),
                                      ],
                                    ),
                                    buttons: [
                                      DialogButton(
                                        onPressed: () => Navigator.pop(context),
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
                                              child: Text('Servis Mesin Ringan',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ),
                                          ),
                                          Container(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text('Delivery',
                                                  style:
                                                      TextStyle(fontSize: 15)),
                                            ),
                                          ),
                                          Container(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'Rp. 50,000',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              ))),
                      Container(
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
                              ]),
                          margin: EdgeInsets.only(top: 20),
                          child: InkWell(
                              onTap: () {
                                Alert(
                                    context: context,
                                    title: "Servis Mesin Berat",
                                    content: Column(
                                      children: <Widget>[
                                        TextField(
                                          decoration: InputDecoration(
                                            icon: Icon(Icons.star),
                                            labelText: 'Plat Nomor',
                                          ),
                                        ),
                                      ],
                                    ),
                                    buttons: [
                                      DialogButton(
                                        onPressed: () => Navigator.pop(context),
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
                                              child: Text('Servis Mesin Berat',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ),
                                          ),
                                          Container(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'On Site',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'Rp. 200,000',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ))),
                      Container(
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
                              ]),
                          margin: EdgeInsets.only(top: 20),
                          child: InkWell(
                              onTap: () {
                                Alert(
                                    context: context,
                                    title: "Gnati Van Belt",
                                    content: Column(
                                      children: <Widget>[
                                        TextField(
                                          decoration: InputDecoration(
                                            icon: Icon(Icons.star),
                                            labelText: 'Plat Nomor',
                                          ),
                                        ),
                                      ],
                                    ),
                                    buttons: [
                                      DialogButton(
                                        onPressed: () => Navigator.pop(context),
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
                                              child: Text('Ganti Van Belt',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ),
                                          ),
                                          Container(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text('Delivery',
                                                  style:
                                                      TextStyle(fontSize: 15)),
                                            ),
                                          ),
                                          Container(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text('Rp. 80,000',
                                                  style:
                                                      TextStyle(fontSize: 15)),
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              )))
                    ],
                  )))
        ],
      ),
    );
  }
}
