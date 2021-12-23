import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bengkel Online App'),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}