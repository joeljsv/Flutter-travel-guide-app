import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripme/screen/feed/feedmain.dart';
import 'package:tripme/screen/front/screens/home_screen.dart';

import 'package:tripme/screen/home.dart';

import 'package:tripme/screen/map.dart';
import 'package:tripme/screen/menue/feed.dart';
import 'package:tripme/screen/menue/guide/gide.dart';
import 'package:tripme/screen/menue/hotel.dart';
import 'package:tripme/screen/onbor.dart';
import 'package:tripme/screen/phone.dart';

import 'package:tripme/screen/signin.dart';
import 'package:tripme/screen/widget/hospital.dart';
import 'package:tripme/screen/widget/hospital.dart';
import 'package:tripme/screen/widget/notification.dart';
import 'package:tripme/screen/widget/resturent.dart';
import 'package:tripme/screen/widget/toilrts.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FirebaseNotifications().setUpFirebase();
  }

  @override
  Widget build(BuildContext context) {
    String _phoneNo;
    return MaterialApp(
      title: 'Yuga',

      theme: ThemeData(
        fontFamily: 'Comfortaa',
        primarySwatch: Colors.green,
        primaryColor: Colors.green,
      ),

      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MyHomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        FirstScreen.routeName: (ctx) => FirstScreen(),
        PhoneAuth.routeName: (ctx) => PhoneAuth(),
        FeedImg.routeName: (ctx) => FeedImg(),
        FeedImg.routeName: (ctx) => FeedImg(),
        HomePage.routeName: (ctx) => HomePage(),

        MainScaffold.routeName: (ctx) => MainScaffold(),
        Guide.routeName: (ctx) => Guide(),
        Hospital.routeName: (ctx) => Hospital(),
        Toilets.routeName: (ctx) => Toilets(),
        Hotels.routeName: (ctx) => Hotels(),
        ListHotel.routeName: (ctx) => ListHotel(),
         MapApp.routeName: (ctx) => MapApp(),

        // HomePage.routeName: (ctx) => HomePage(),
      },
    );
  }
}
