import 'package:flutter/material.dart';
import '../services/auth/auth.dart';

import '';
class HomePage extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Column(
      children: <Widget>[
        Text('Home Page'),
        FlatButton(onPressed: (){}, child: null)
      ],
    ),),);
  }
}