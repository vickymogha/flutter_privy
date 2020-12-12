import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:privystreet_flutterapp/QRShapeBoarderCustom.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


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

  QRViewController controller;


  @override
  void initState() {
    super.initState();

  }


  @override
  void dispose() {
    controller?.dispose();



    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    print("hello rebuild");
    return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body:SingleChildScrollView(
          child:Column(
            children: <Widget>[
              AspectRatio(
                  aspectRatio: 1,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child:  QRView(
                          key: qrKey,
                          onQRViewCreated: _onQRViewCreated,
                          overlay: QrScannerOverlayShapeCustom(),
                        ),
                      )
                    ],
                  )),
              MyWidget()],

          ),
        ));
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }

}

class MyWidget extends StatelessWidget{
  final border = OutlineInputBorder(
      borderSide: new BorderSide(
          style: BorderStyle.solid, width: 1, color: Colors.green),
      borderRadius: BorderRadius.all(Radius.circular(10)));

  @override
  Widget build(BuildContext context) {
     return  Row(
       textDirection: TextDirection.rtl,
       children: <Widget>[
         Expanded(
           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: <Widget>[
               Container(
                 margin: EdgeInsets.only(top: 40.0, bottom: 10.0),
                 child: Text("OR  sjj"),
               ),
               TextField(
                 textAlign: TextAlign.center,
                 decoration: InputDecoration(
                   filled: true,
                   fillColor: Colors.yellow[50],
                   hintText: "Enter Code1",
                   border: border,
                   focusedBorder: border,
                   enabledBorder: border,
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(20.0),
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
             ],
           ),
         ),
       ],
     );
  }

}
