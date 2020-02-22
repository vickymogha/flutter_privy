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

class _ProfileState extends State<ProfileFragment> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(

        body: Column(
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 70),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text("Profile")
                  ],
                ),
              ),
            )),
          ],
        ));
  }
}
