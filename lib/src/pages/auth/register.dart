import 'package:flutter/material.dart';
import './../../components/auth/auth_card.dart';
import './login.dart';

class RegisterPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Register()
    );
  }
}

class Register extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: AuthCard(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 25),
            child: Icon(Icons.car_repair, size: 90),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Text('BENGKEL ONLINE APP',
                style: TextStyle (
                  fontSize: 23,
                  fontWeight: FontWeight.bold
              ),
            )),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(),
                  labelText: 'Username'
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(),
                  labelText: 'Name'
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(),
                    labelText: 'Password'
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Register'),
              ),
            ),
            Container(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}