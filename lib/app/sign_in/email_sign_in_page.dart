import 'package:flutter/material.dart';
import 'package:mypill/services/auth.dart';

import 'email_sign_in_form_stateful.dart';

class EmailSignInPage  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Sign in"),
        elevation: 2.0,
      ), //AppBar
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: EmailSignInFormStateful(),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    ); //Scaffold
  }
}

