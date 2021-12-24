import 'package:flutter/material.dart';
import 'src/pages/auth/login.dart';
import 'package:get_it/get_it.dart';
import 'src/databases/user_database.dart';
import 'package:get_storage/get_storage.dart';

final getIt = GetIt.instance;

void main() async {
  await GetStorage.init();
  getIt.registerSingleton<UserDatabase>(UserDatabase());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
