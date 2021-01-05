import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:privystreet_flutterapp/FlutterCustomText.dart';
import 'package:privystreet_flutterapp/dashboard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:progress_dialog/progress_dialog.dart';

ProgressDialog pr;

class SignInScreen extends StatefulWidget {
  static const String tag = "signin-page";


  @override
  _SignInState createState() {
    // TODO: implement createState
    return _SignInState();
  }
}

class _SignInState extends State<SignInScreen> {
  static const platform = const MethodChannel('samples.flutter.dev/battery');


  @override
  void initState() {
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal, showLogs: true);
    pr.style(message: 'Please wait...');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {

      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
      _hitLoginService();
    });
  }

  Future<void> _hitLoginService() async {
    var url = 'https://www.googleapis.com/books/v1/volumes?q={http}';
    pr.show();
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse.toString());
      var itemCount = jsonResponse['totalItems'];
      var id = jsonResponse['items'][0]["id"];
      print('Number of books id: $id');
      print('Number of books about http: $itemCount.');
      final snackBar =  SnackBar(content: Text('Success '+id + ' status = '+ response.statusCode.toString()));
      _scaffoldKey.currentState.showSnackBar(snackBar);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      final snackBar =  SnackBar(content: Text('Failed '+response.statusCode.toString()));
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

    pr.hide();
    Navigator.of(context).pushNamed(DashBoard.tag);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {

    print("render Signin");
    final border = OutlineInputBorder(
        borderSide: new BorderSide(
            style: BorderStyle.solid, width: 1, color: Colors.green),
        borderRadius: BorderRadius.all(Radius.circular(10)));

    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.green,
              child: Text("SignInScreen"),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 20,
                right: 20,
              ),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.yellow[50],
                    border: border,
                    focusedBorder: border,
                    enabledBorder: border,
                    hintText: "Enter Password"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.yellow[50],
                    border: border,
                    focusedBorder: border,
                    enabledBorder: border,
                    hintText: "Enter Password"),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 60, right: 20, left: 20),
                child: SizedBox(
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Visibility(
                      visible: true,
                      child: Text(
                        _batteryLevel,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      _getBatteryLevel();
                    },
                  ),
                ),
              ),
            ),
            TextView(text: "Helloo frienddfds \n safdsfdsa",),

            LimitedBox(

              child: Text("hello2",
                style: TextStyle(

                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
