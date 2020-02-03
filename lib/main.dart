import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripme/screen/Home.dart';
import 'package:tripme/screen/signin.dart';
import 'package:tripme/screen/warpper.dart';
import 'package:tripme/services/auth/auth.dart';

import'./screen/onbor.dart';
import 'models/user.dart';
void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child:  MaterialApp(
      title: 'Material Page Reveal',
      theme:  ThemeData(
        primarySwatch: Colors.blue,
      ),
     
  // Start the app with the "/" named route. In this case, the app starts
  // on the FirstScreen widget.
  initialRoute: '/',
  routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    '/': (context) => Wrapper(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    SignIn.routeName: (ctx) => SignIn(),
    HomePage.routeName: (ctx) => HomePage(),
  },
));
    
  }
}


