import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripme/screen/menue/guide/gpro.dart';
import 'package:tripme/screen/menue/guide/homg.dart';
import 'package:tripme/screen/menue/guide/proguide.dart';

class Guide extends StatefulWidget {
  static const routeName = '/guide';

  @override
  _GuideState createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(FontAwesomeIcons.angleDoubleUp)),
                Tab(icon: Icon(Icons.message)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text(
              'YUGA',
              style: GoogleFonts.comfortaa(),
            ),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              TimeseriesChartExample(),
              GuidePRofile(),
              UserProfilePage(),
            ],
          ),
        ));
  }
}
