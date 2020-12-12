import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:privystreet_flutterapp/dashboard.dart';

class ProfileFragment extends StatefulWidget {
  static const String tag = "profile-page";

  @override
  _ProfileState createState() {
    // TODO: implement createState
    return _ProfileState();
  }
}

class ListData {
  String name;
  bool isExpaned = false;
}

class _ProfileState extends State<ProfileFragment> {
  List<ListData> tiles;
  int index = -1;

  @override
  void initState() {
    tiles = new List();

    for (int i = 0; i < 100; i++) {
      ListData data = new ListData();
      data.name = "vikash";
      tiles.add(data);
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("heello");

    return Scaffold(
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: tiles.reversed.map((data) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: new ExpansionTile(
                initiallyExpanded: data.isExpaned,
                leading: Icon(
                  Icons.email,
                  size: 50,
                ),
                trailing: data.isExpaned
                    ? Icon(Icons.arrow_drop_up, size:30):Icon(Icons.arrow_drop_down, size: 30,),
                subtitle: Text("Vasdkfldskfkdsfkl lskdfjas"),
                title: Text(data.name),
                children: <Widget>[
                  Text("inner"),
                  Text("inner"),
                  Text("inner"),
                  Text("inner"),
                  Text("inner"),
                  Text("inner"),
                ],
                onExpansionChanged: (bool value) {
                  setState(() {

                    value ? (data.isExpaned = true) : data.isExpaned = false;
                  });
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
