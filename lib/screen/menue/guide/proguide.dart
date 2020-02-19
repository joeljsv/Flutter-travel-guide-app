import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class GuidePRofile extends StatefulWidget {
  @override
  _GuidePRofileState createState() => _GuidePRofileState();
}

class _GuidePRofileState extends State<GuidePRofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('inbox').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.name, style: GoogleFonts.comfortaa(fontSize: 30)),
          isThreeLine: true,
          subtitle: Text(record.place, style: GoogleFonts.comfortaa()),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'No:of Day',
                style: GoogleFonts.comfortaa(),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                record.day.toString(),
                style: GoogleFonts.comfortaa(),
              ), SizedBox(
                width: 30,
              ),
              Container(
                child:record.ver?Icon(Icons.check, color: Colors.green):Icon(Icons.clear,
                color: Colors.red,)
              )
            ],
          ),
          onTap: () => record.reference.updateData({'ver': true}),
        ),
      ),
    );
  }
}

class Record {
  final String name;
  final int day;
  final int phn;
  final String cat;
  final String place;
  final DocumentReference reference;
  bool ver;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['phone'] != null),
        assert(map['day'] != null),
        assert(map['place'] != null),
        assert(map['catg'] != null),
        name = map['name'],
        day = map['day'],
        phn = map['phone'],
        cat = map['cat'],
        place = map['place'],
        ver = map['ver'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$day:$place.>";
}
