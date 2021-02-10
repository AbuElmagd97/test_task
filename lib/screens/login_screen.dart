import 'package:flutter/material.dart';
import 'package:testtask/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: LoginForm(),
      ),
    );
  }
}
