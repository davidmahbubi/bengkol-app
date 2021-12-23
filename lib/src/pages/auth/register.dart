import 'dart:async';

import 'package:bengkol_app/main.dart';
import 'package:bengkol_app/src/databases/user_database.dart';
import 'package:flutter/material.dart';
import './../../components/auth/auth_card.dart';
import './../../models/user.dart';

class RegisterPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Register()
    );
  }
}

class Register extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }

}

class RegisterState extends State<Register> {

  bool loginLoadingState = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                controller: nameController,
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
                controller: usernameController,
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
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(),
                    labelText: 'Password'
                ),
              ),
            ),
            Container(
              width: loginLoadingState ? null : double.infinity,
              margin: EdgeInsets.only(top: 20, bottom: loginLoadingState ? 10 : 0),
              child: loginLoadingState ? CircularProgressIndicator() : ElevatedButton(
                onPressed: () {

                  setState(() {
                    loginLoadingState = true;
                  });

                  Timer(Duration(milliseconds: 500), () {

                    UserDatabase userDatabase = getIt<UserDatabase>();

                    User newUser = User(
                      name: nameController.text,
                      username: usernameController.text,
                      password: passwordController.text
                    );

                    userDatabase.storeUser(newUser);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Registrasi Berhasil !'))
                    );

                    setState(() {
                      loginLoadingState = false;
                    });

                    Navigator.pop(context);

                  });
                },
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