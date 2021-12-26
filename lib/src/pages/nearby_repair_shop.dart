import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

class NearbyRepairShopPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NearbyRepairShopState();
  }
}

class NearbyRepairShopState extends State<NearbyRepairShopPage> {

  bool isLoading = true;
  List nearbyRepairShop = [
    [Icons.place, '350m', 'Bengkel "Abadi"', "Jln. Gajah Mada No. 9, Banyuwangi", '08:00 - 20:00'],
    [Icons.place, '400m', 'Bengkel Jaya', "Jln. Siliwangi No. 10, Banyuwangi", '09:30 - 17:00'],
    [Icons.place, '1.2 km', 'Bengkel Sentosa', "Jln. Pattimura No. 1, Banyuwangi", '09:30 - 17:00'],
  ];

  initState() {
    Timer(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Bengkel Terdekat'),
      ),
      body: isLoading ? Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          ),
          Text('Memuat Bengkel Terdekat ...')
        ],
      ) : ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: SvgPicture.asset('assets/images/destination_ic.svg', height: 200),
              ),
              for (int i = 0; i < nearbyRepairShop.length; i++) Container(
                margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                padding: EdgeInsets.all(18),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 3)
                    )
                  ]
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Icon(nearbyRepairShop[i][0], size: 40,),
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          child: Text(nearbyRepairShop[i][1]),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                nearbyRepairShop[i][2],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )
                              ),
                            ),
                          ),
                          Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                nearbyRepairShop[i][3],
                                style: TextStyle(
                                  fontSize: 15
                                )
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                nearbyRepairShop[i][4],
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 15
                                )
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 8),
                                  child: FaIcon(FontAwesomeIcons.motorcycle, size: 15),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 8),
                                  child: FaIcon(FontAwesomeIcons.car, size: 15),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 8),
                                  child: FaIcon(FontAwesomeIcons.truck, size: 15),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 8),
                                  child: FaIcon(FontAwesomeIcons.truckPickup, size: 15),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            child: Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Lihat di Maps'),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    child: Text('Lihat Kontak'),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                    ))
                  ],
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}