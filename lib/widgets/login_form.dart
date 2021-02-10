import 'package:flutter/material.dart';
import 'package:testtask/screens/home_screen.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  String value;
  bool _obscureText = true;

  bool validateAndSubmit() {
    if (_formKey.currentState.validate()) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _emailTextField(),
            SizedBox(
              height: 30,
            ),
            _passwordTextField(),
            SizedBox(
              height: 30,
            ),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      controller: _email,
      decoration: InputDecoration(
        labelText: "Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (value) {
        if(value.isEmpty){
          return 'Email can\'t be empty';
        }
        if(!value.contains("@")){
          return 'Invalid Email';
        }
        return null;
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      autofocus: false,
      controller: _password,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: (){
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            semanticLabel:
            _obscureText ? 'show password' : 'hide password',
          ),
        ),
        labelText: "Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      obscureText: _obscureText,
      validator: (value) {
        return value.isEmpty ? 'Password can\'t be empty' : null;
      },
    );
  }

  Widget _loginButton() {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.all(12),
      color: Colors.lightBlueAccent,
      child: Text('Log In', style: TextStyle(color: Colors.white)),
      onPressed: () {
        if (validateAndSubmit()) {
          print(_email.text);
          Navigator.pushNamed(context, HomeScreen.routeName);
        }
      },
    );
  }
}
