import 'package:flutter/material.dart';
import 'package:testtask/screens/home_screen.dart';
import 'screens/login_screen.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        HomeScreen.routeName:(ctx)=>HomeScreen(),
      },
    );
  }
}
