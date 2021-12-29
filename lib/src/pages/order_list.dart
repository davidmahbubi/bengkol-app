import 'package:bengkol_app/src/models/order/riwayat_order.dart';
import 'package:bengkol_app/src/pages/order/order_history_detail.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrderListState();
  }
}

class OrderListState extends State<OrderListPage> {
  int loopIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Order'),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            child: SvgPicture.asset('assets/images/thought.svg', height: 200),
          ),
          ...RiwayatOrder.riwayatOrder.reversed.map((val) {
            return Container(
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
                        offset: Offset(0, 3))
                  ]),
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return OrderHistoryDetail(val);
                    }));
                  },
                  child: Row(
                    children: [
                      Column(
                        children: [
                          FaIcon(FontAwesomeIcons.history, size: 35),
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
                                  child: Text(val.namaLayanan,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                              Container(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(val.tanggal.toLocal().toString(),
                                      style: TextStyle(fontSize: 15)),
                                ),
                              ),
                            ],
                          ))
                    ],
                  )),
            );
          }).toList(),
        ],
      ),
    );
  }
}
