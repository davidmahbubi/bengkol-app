import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServicePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ServiceState();
  }

}

class ServiceState extends State<ServicePage> {

  List vehicleTypes = [
    [FaIcon(FontAwesomeIcons.motorcycle), 'Sepeda Motor'],
    [FaIcon(FontAwesomeIcons.car), 'Mobil'],
    [FaIcon(FontAwesomeIcons.truckPickup), 'Pick Up'],
    [FaIcon(FontAwesomeIcons.truck), 'Truk'],
    [FaIcon(FontAwesomeIcons.bus), 'Bus'],
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Servis Kendaraan'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  children: [
                    SvgPicture.asset('assets/images/car.svg', height: 200),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: Text(
                      'Pilih Tipe Kendaraan Anda',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    )
                  ],
                )
              ),
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
                          itemCount: vehicleTypes.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1,
                              crossAxisCount: 2,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 4.0
                          ),
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
                                    vehicleTypes[index][0],
                                    SizedBox(height: 20),
                                    Text(
                                      vehicleTypes[index][1],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black87
                                      ),
                                    )
                                  ],
                                ),
                                onTap: () {
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
          )
        ],
      ),
    );
  }
}