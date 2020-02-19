import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripme/models/search.dart';
import 'package:tripme/screen/feed/feedmain.dart';
import 'package:tripme/screen/front/screens/home_screen.dart';
import 'package:tripme/screen/signin.dart';
import 'package:tripme/services/auth/auth.dart';

import 'drwer.dart';

Widget buildButton(Widget icon, String title, String id) {
  return Column(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: Colors.lightBlue),
        ),
        child: FlatButton(
          shape: CircleBorder(),
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.all(6),
            margin: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                icon,
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: 2,
      ),
      Text(title, style: GoogleFonts.comfortaa(fontWeight: FontWeight.bold)),
    ],
  );
}

class FirstScreen extends StatefulWidget {
  static const routeName = '/first';

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(FontAwesomeIcons.tripadvisor)),
                  Tab(icon: Icon(Icons.contacts)),
                ],
              ),
              title: Text('YUGA', style: GoogleFonts.comfortaa(),),
              centerTitle: true,
            ),
            body: TabBarView(
              children: [HomeScreen(), MainScaffold(), UserProfilePageus()],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Icon(
                        FontAwesomeIcons.check,
                        color: Colors.green,
                      ),
                      content: const Text('Succesfully Reported issue'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Ok'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(FontAwesomeIcons.tripadvisor),
            )));
  }
}
