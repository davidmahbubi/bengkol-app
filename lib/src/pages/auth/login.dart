import 'dart:async';

import 'package:flutter/material.dart';
import './../../components/auth/auth_card.dart';
import './register.dart';

class LoginPage extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins'
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldStateKey,
        body: Login(_scaffoldStateKey),
      ),
    );
  }
}

class Login extends StatefulWidget {

  final _scaffoldKey;

  Login(this._scaffoldKey);

  State createState() {
    return LoginState(_scaffoldKey);
  }

}

class LoginState extends State<Login> {

  final _scaffoldKey;
  bool loginLoadingState = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginState(this._scaffoldKey);

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
                      Timer(Duration(seconds: 2), () {
                        setState(() {
                          if (usernameController.text == 'david' && passwordController.text == 'mahbubi') {
                            print('Hello David');
                          } else {
                            print('Who the heck are you ?');
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