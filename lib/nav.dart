import 'package:flutter/material.dart';
import 'home.dart';
import 'mylist.dart';
import 'more.dart';

class MyBottomNavigationBarState extends StatefulWidget {
  @override
  _MyBottomNavigationBarStateState createState() => _MyBottomNavigationBarStateState();
}

class _MyBottomNavigationBarStateState extends State<MyBottomNavigationBarState> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:
        [
          BottomNavigationBarItem
            (
              icon:new Icon(Icons.home),
              title: new Text("Home")
          ),
          BottomNavigationBarItem
            (
              icon:new Icon(Icons.list),
              title: new Text("My List")
          ),
          BottomNavigationBarItem
            (
              icon:new Icon(Icons.more),
              title: new Text("More")
          ),
        ],

      ),
    );
  }
}


