import 'package:flutter/material.dart';
import 'nav.dart';
class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
          child: Column(
            children: <Widget>[
              Center(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(radius: 50.0,backgroundImage: AssetImage('images/profile.jpg'),),
              )),


            ],
          )
      ),


    );
  }
}
