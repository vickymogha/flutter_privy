import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:privystreet_flutterapp/History.dart';
import 'package:privystreet_flutterapp/ProfileFragment.dart';
import 'package:privystreet_flutterapp/RowColumn.dart';
import 'package:privystreet_flutterapp/ScanNowFragment.dart';

class DashBoard extends StatefulWidget {
  static const String tag = "dashboard-page";

  final drawerItems = [
    new DrawerItem("Scan Now", Icons.rss_feed),
    new DrawerItem("Profile", Icons.local_pizza),
    new DrawerItem("History", Icons.info),
    new DrawerItem("Logout", Icons.info)
  ];

  @override
  _DashBoardState createState() {
    // TODO: implement createState
    return _DashBoardState();
  }
}

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

class _DashBoardState extends State<DashBoard> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return ScanNowFragment();
      case 1:
        return ProfileFragment();
      case 2:
        return HistoryFragment();
      case 3:
        return ColumnRowFragment();

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

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
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }
    final border = OutlineInputBorder(
        borderSide: new BorderSide(
            style: BorderStyle.solid, width: 1, color: Colors.green),
        borderRadius: BorderRadius.all(Radius.circular(10)));

    return Scaffold(
        floatingActionButton: SpeedDial(
          // both default to 16
          marginRight: 18,
          marginBottom: 20,
          animatedIcon: AnimatedIcons.event_add,
          animatedIconTheme: IconThemeData(size: 22.0),
          // this is ignored if animatedIcon is non null
          // child: Icon(Icons.add),
          //visible: _dialVisible,
          // If true user is forced to close dial manually
          // by tapping main button and overlay is not rendered.
          closeManually: false,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          onOpen: () => print('OPENING DIAL'),
          onClose: () => print('DIAL CLOSED'),
          tooltip: 'Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          elevation: 8.0,
          animationSpeed: 70,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
                child: Icon(Icons.accessibility),
                backgroundColor: Colors.red,
                onTap: () => print('FIRST CHILD')
            ),
            SpeedDialChild(
              child: Icon(Icons.brush),
              backgroundColor: Colors.blue,
              onTap: () => print('SECOND CHILD'),
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
              ),
              Column(children: drawerOptions)
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(widget.drawerItems[_selectedDrawerIndex].title),
        ),
        body: _getDrawerItemWidget(_selectedDrawerIndex));
  }
}
