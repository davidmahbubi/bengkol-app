import 'package:flutter/material.dart';

class NearbyRepairShopPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NearbyRepairShopState();
  }
}

class NearbyRepairShopState extends State<NearbyRepairShopPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bengkel Terdekat'),
      ),
      body: Text('Halaman bengkel terdekat'),
    );
  }
}