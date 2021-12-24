import 'dart:async';

import 'package:bengkol_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import './register.dart';
import './../../models/user.dart';
import './../../components/auth/auth_card.dart';
import './../../databases/user_database.dart';
import './../homepage.dart';

class LoginPage extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins'
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Login(),
      ),
    );
  }

}

class Login extends StatefulWidget {

  State createState() {
    return LoginState();
  }

}

class LoginState extends State<Login> {

  final GetStorage box = GetStorage();

  bool loginLoadingState = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
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
              margin: EdgeInsets.only(top: 70),
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
                    setState(() {
                      UserDatabase userDatabase = getIt<UserDatabase>();

                      User? existUser = userDatabase.getUserByUsername(usernameController.text);

                      if (existUser != null && passwordController.text == existUser.password) {

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Selamat datang ${existUser.name}')),
                        );

                        box.write('active_user', existUser.name);

                        Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('User tidak ditemukan !'))
                        );
                      }

                      loginLoadingState = false;

                    });
                  });
                },
                child: Text('Login'),
              ),
            ),
            Container(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  usernameController.clear();
                  passwordController.clear();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}