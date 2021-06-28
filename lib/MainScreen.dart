import 'package:flutter/material.dart';
import 'package:mypill/services/auth.dart';
import 'app/sign_in/landing.page.dart';
import 'app/sign_in/sign_in_button.dart';
import 'doctor.dart';
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  'MyPill',
                  style: TextStyle(
                    fontFamily: 'Chewy-Regular',
                    fontSize: 70.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 100.0, 10.0, 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'App That Will Keep Track Of Your Medicine And Medical Status.',
                      style: TextStyle(
                        fontFamily: 'Oxygen-Regular',
                        fontSize: 13.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,

                      ),
                    ),



                  ],
                ),

              ),
              Container(
                margin: EdgeInsets.fromLTRB(100.0, 0.0, 0.0, 0.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'We Will Save You Some Headache.',
                      style: TextStyle(
                        fontFamily: 'Oxygen-Regular',
                        fontSize: 13.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ],

                ),
              ),
              SizedBox(height: 150.0),
              SignInButton(
                text: 'Sign in',
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>LandingPage())
                  );
                },
              ), //SignInButton
              SizedBox(height: 8.0),
              SignInButton(
                text: 'Doctor',
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Doctor())
                  );
                },
              ), //SignInButton

            ],
          )
      ),


    );
  }
}
