import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ServiceState();
  }

}

class ServiceState extends State<ServicePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Servis Kendaraan'),
      ),
      body: Text('Service Kendaaraan page'),
    );
  }
}