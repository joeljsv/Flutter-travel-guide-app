import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tripme/Animation/FadeAnimation.dart';
import 'package:tripme/screen/home.dart';
import 'package:tripme/screen/phone.dart';
import 'package:tripme/services/auth/auth.dart';

import 'front/screens/home_screen.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget _signInButton() {
      return OutlineButton(
        splashColor: Colors.grey,
        onPressed: () {
          signInWithGoogle().whenComplete(() {
            Navigator.pushReplacementNamed(context, FirstScreen.routeName)
                // Navigator.of(BuildContext context).push(
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return FirstScreen();
                //     },

                ;
          });
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        highlightElevation: 0,
        borderSide: BorderSide(color: Colors.grey),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("assets/google.png"), height: 35.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    color: Color.fromRGBO(206, 35, 158, 1),
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 400,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -40,
                    height: 400,
                    width: width,
                    child: Text('data'),
                  ),
                  Positioned(
                    height: 400,
                    width: width + 20,
                    child: FadeAnimation(
                        8.3,
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/background-2.png'),
                                  fit: BoxFit.fill)),
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                      8.5,
                      Center(
                        child: Text(
                          "YUGA",
                          style: GoogleFonts.comfortaa(
                              fontSize: 50, fontWeight: FontWeight.w800),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                    child: Center(
                      child: Text(
                        "Let's GO....",
                        style: GoogleFonts.comfortaa(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    9.9,
                    Center(
                      child: _signInButton(),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                    5,
                    Center(
                      child: Text("Welcome to YUGA ",
                          style: GoogleFonts.comfortaa(color: Colors.black87)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                    10,
                    Center(
                      child: Text(
                        "------------------------------------------------------------",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                      9.6,
                      Center(
                          child: Text(
                        'Are you a Guide?',
                        style: GoogleFonts.comfortaa(),
                      ))),
                  FadeAnimation(
                      9.6,
                      Center(
                          child: FlatButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, PhoneAuth.routeName);
                              },
                              textColor: Colors.blue,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Let\'s Go !!',
                                    style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.forward),
                                ],
                              ))))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
