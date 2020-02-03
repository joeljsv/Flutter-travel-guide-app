import 'package:flutter/material.dart';
import 'package:tripme/screen/Home.dart';
import 'package:tripme/services/auth/auth.dart';
import '';

class SignIn extends StatefulWidget {
 static const routeName = '/auth';

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
 final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(child: Text('Sign In'),),
          FlatButton(child: Text('SignIN'),
          onPressed: () async {
            dynamic result = await _auth.signInWithGoogle();
            if(result == null){
               print('error signing in');
              print('error signing in');
            } else {
              print('signed in');
              print(result.uid);
               Navigator.pushReplacementNamed(context, HomePage.routeName);
            }
          },)
        ],
      ),
    );
  }
}