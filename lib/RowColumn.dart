import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:privystreet_flutterapp/dashboard.dart';

class ColumnRowFragment extends StatefulWidget {
  static const String tag = "column-page";

  @override
  _ColumnRowState createState() {
    // TODO: implement createState
    return _ColumnRowState();
  }
}

class ListData {
  String name;
  bool isExpaned = false;
}

class _ColumnRowState extends State<ColumnRowFragment>
    with SingleTickerProviderStateMixin {
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
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TabBar(
              indicatorWeight: 0,
              unselectedLabelColor: Colors.black,
              dragStartBehavior: DragStartBehavior.down,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.green,
              indicator: selectedIndicator(),
              labelColor: Colors.white,
              labelPadding: EdgeInsets.all(0),
              isScrollable: true,
              tabs: [
                Tab(
                  child: _border("12 Dec"),
                ),
                Tab(
                  child: _border("13 Dec"),
                ),
                Tab(
                  child: _border("14 Dec"),
                ),
                Tab(
                  child: _border("15 Dec"),
                ),
                Tab(
                  child: _border("16 Dec"),
                ),
                Tab(
                  child: _border("17 Dec"),
                ),
                Tab(
                  child: _border("18 Dec"),
                ),

              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          child: TextField(
                            decoration: InputDecoration(hintText: "Vikash"),
                          ),
                          color: Colors.yellow,
                        ),
                        Container(
                          child: TextField(
                            decoration: InputDecoration(hintText: "Vikash"),
                          ),
                          color: Colors.yellow,
                        ),
                        Container(
                          child: TextField(
                            decoration: InputDecoration(hintText: "Vikash"),
                          ),
                          color: Colors.yellow,
                        ),
                        Container(
                          child: TextField(
                            decoration: InputDecoration(hintText: "Vikash"),
                          ),
                          color: Colors.yellow,
                        ),
                        Container(
                          child: TextField(
                            decoration: InputDecoration(hintText: "Vikash"),
                          ),
                          color: Colors.yellow,
                        ),
                        Container(

                          child: TextField(
                            autofocus: true,
                            decoration: InputDecoration(hintText: "Vikash"),
                          ),
                          color: Colors.yellow,
                        ),
                        Container(
                          child: TextField(
                            decoration: InputDecoration(hintText: "Vikash"),
                          ),
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.directions_transit),
                  Icon(Icons.directions_bike),
                  Icon(Icons.directions_bike),
                  Icon(Icons.directions_bike),
                  Icon(Icons.directions_car),
                  Icon(Icons.directions_transit),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  Container _border(String text) {
    return new Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1),
          border: Border.all(color: Colors.green, width: 0)),
      child: ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: 100
          ),
          child: Align(child: Text(text))),
    );
  }

  BoxDecoration selectedIndicator() {
    return BoxDecoration(
        color: Colors.green[300],
        borderRadius: BorderRadius.circular(1),
        border: Border.all(color: Colors.green, width: 0));
  }
}
