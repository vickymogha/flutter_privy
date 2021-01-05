import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

typedef void TextViewCreatedCallback(TextViewController controller);

class TextView extends StatefulWidget {
  const TextView({Key key, this.text}) : super(key: key);

  final String text;

  @override
  State<StatefulWidget> createState() => _TextViewState();
}

double height1 = 10;

class _TextViewState extends State<TextView> {
  final GlobalKey _key = GlobalKey(debugLabel: "dd");
  TextViewController controller;
  bool updateUI = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 50,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Visibility(
              visible: true,
              child: Text(
                "sss",
                style: TextStyle(color: Colors.white),
              ),
            ),
            onPressed: () {},
          ),
        ),
        SizedBox(
          height: height1,
          child: _getPlatformTextView(),
        ),
      ],
    );
  }

  Widget _getPlatformTextView() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      print("render android1");
      AndroidView view = new AndroidView(
        key: _key,
        viewType: 'samples.flutter.dev/textview',
        onPlatformViewCreated: _onPlatformViewCreated,
      );

      if (controller == null) {
        print("render Not created");
      } else {
        update();
        print("render created");
      }

      print("render android " + height1.toString());
      return view;
    }

    return Text(
        '$defaultTargetPlatform is not yet supported by the text_view plugin');
  }

  void _onPlatformViewCreated(int id) {
    controller = new TextViewController._(id);
    update();
  }

  Future<void> update() async {
    if (controller != null) {
      int result = await controller.setText(widget.text, _key, widget);
      if (updateUI) {
        updateUI = false;
        setState(() {
          print("height1 = " + result.toString());
          height1 = result.toDouble();
          print("state changed");
        });
      } else {
        updateUI = true;
      }
    }
  }
}

class TextViewController {
  TextViewController._(int id)
      : _channel = new MethodChannel('samples.flutter.dev/textview_$id');

  final MethodChannel _channel;

  Future<int> setText(String text, GlobalKey key, Widget wi) async {
    assert(text != null);
    final int height = await _channel.invokeMethod('setText', text);
    return (height/2).toInt();
  }
}
