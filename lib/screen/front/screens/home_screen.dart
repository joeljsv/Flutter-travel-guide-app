import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripme/screen/front/widgets/destination_carousel.dart';
import 'package:tripme/screen/front/widgets/hotel_carousel.dart';
import 'package:tripme/screen/map.dart';
import 'package:tripme/screen/menue/hotel.dart';
import 'package:tripme/screen/widget/hospital.dart';
import 'package:tripme/screen/widget/resturent.dart';
import 'package:tripme/screen/widget/toilrts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plus,
    FontAwesomeIcons.footballBall,
    Icons.restaurant,
    FontAwesomeIcons.biking,
    FontAwesomeIcons.toilet,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          Navigator.pushNamed(context, Hospital.routeName);
        }
        if (index == 4) {
          Navigator.pushNamed(context, Toilets.routeName);
        }
        if (index == 2) {
          Navigator.pushNamed(context, Hotels.routeName);
        }
        if (index == 1) {
            Navigator.pushNamed(context, MapApp.routeName);
        }
        if (index == 3) {
          Navigator.pushNamed(context, ListHotel.routeName);
        }
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index ? Colors.white : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'What would you like to find?',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            SizedBox(height: 20.0),
            DestinationCarousel(),
            SizedBox(height: 20.0),
            HotelCarousel(),
            SizedBox(height: 20.0),
            Text(
              '\t\t\t\tUpcoming Festivals',
              style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 200.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[_buildProgrammCard()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildProgrammCard() {
  return Container(
    height: 250,
    child: Card(
      child: Stack(
        children: <Widget>[
          Text(
            'Chettikulangra',
            style: GoogleFonts.comfortaa(color: Colors.white),
          ),
          Image.network(
            'https://media-cdn.tripadvisor.com/media/photo-s/06/6b/a9/96/chettaikulanagara-kumbha.jpg',
            fit: BoxFit.cover,
          ),
          Text(
            'Chettikulangra',
            style: GoogleFonts.comfortaa(color: Colors.white, fontSize: 30),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
    ),
  );
}
