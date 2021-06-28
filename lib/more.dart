import 'package:flutter/material.dart';
import 'nav.dart';

class More extends StatelessWidget {
  const More({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(""),
      ),
      body: MyBottomNavigationBarState (),

    );
  }
}
