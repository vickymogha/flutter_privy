import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:privystreet_flutterapp/QRShapeBoarderCustom.dart';


class ScanNowFragment extends StatefulWidget {
  static const String tag = "scannow-page";

  @override
  _ScanNowState createState() {
    // TODO: implement createState
    return _ScanNowState();
  }
}

class _ScanNowState extends State<ScanNowFragment> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";

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
        borderSide: new BorderSide(
            style: BorderStyle.solid, width: 1, color: Colors.green),
        borderRadius: BorderRadius.all(Radius.circular(10)));

    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
            child: Column(
          children: <Widget>[
            Expanded(
                child: Stack(
              children: <Widget>[
                QRBarScannerCamera(
                  onError: (context, error) => Text(
                    error.toString(),
                    style: TextStyle(color: Colors.red),
                  ),
                  qrCodeCallback: (code) {},
                ),
                Container(
                  decoration: ShapeDecoration(
                    shape: QrScannerOverlayShapeCustom(),
                  ),
                )
              ],
            )),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text("OR"),
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.yellow[50],
                        hintText: "Enter QR Code1",
                        border: border,
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Visibility(
                            visible: true,
                            child: Text(
                              "Proceed1",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          onPressed: () {

                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ],
    ));
  }
}
