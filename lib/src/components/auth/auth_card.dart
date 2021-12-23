import 'package:flutter/material.dart';

class AuthCard extends StatelessWidget {

  Widget? child;
  EdgeInsetsGeometry padding;
  
  AuthCard({this.child, this.padding = const EdgeInsets.all(20)});

  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 90),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
            spreadRadius: 0.5,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ]
      ),
      child: child,
    );
  }
}