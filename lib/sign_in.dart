import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:privystreet_flutterapp/dashboard.dart';


class SignInScreen extends StatefulWidget {

  static const String tag = "signin-page";
  @override
  _SignInState createState() {
    // TODO: implement createState
    return _SignInState();
  }
}

class _SignInState extends State<SignInScreen> {
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
    final border = OutlineInputBorder(
        borderSide: new BorderSide(style:BorderStyle.solid,width:1,color: Colors.green),
        borderRadius:
        BorderRadius.all(Radius.circular(10)));



    return Scaffold(

        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.green,
              child: Text("SignInScreen"),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 70),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.yellow[50],
                      hintText: "Enter UserName",
                      border: border,
                      focusedBorder: border ,
                      enabledBorder: border,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.yellow[50],
                          border: border,
                          focusedBorder: border ,
                          enabledBorder: border,
                          hintText: "Enter Password"),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 60,
                      ),
                      child: SizedBox(
                        height: 50,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),

                          child: Visibility(
                            visible: true,
                            child:  Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white),
                          ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(DashBoard.tag);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ));
  }
}
