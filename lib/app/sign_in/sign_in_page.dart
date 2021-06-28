
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mypill/app/sign_in/email_sign_in_page.dart';
import 'package:mypill/app/sign_in/sign_in_bloc.dart';
import 'package:mypill/app/sign_in/sign_in_button.dart';
import 'package:mypill/app/sign_in/social_sign_in_button.dart';
import 'package:mypill/common_widgets/show_exception_alert_dialog.dart';
import 'package:mypill/services/auth.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  static Widget create(BuildContext context){
    return Provider<SignInBloc>(
      create: (_) => SignInBloc(),
      child: SignInPage(),
    ); //Provider
  }

  void _showSignInError(BuildContext context, Exception exception){
    if (exception is FirebaseException && exception.code == 'ERROR_ABORTED_BY_USER') {
      return;
    }
    showExceptionAlertDialog(
      context,
      title: 'Sign in failed',
      exception: exception,
    );
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    final bloc = Provider.of<SignInBloc>(context, listen: false);
    try {
      bloc.setIsLoading(true);
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInAnonymously();
    } on Exception catch (e) {
      _showSignInError(context,e);
    } finally {
     bloc.setIsLoading(false);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    final bloc = Provider.of<SignInBloc>(context, listen: false);
    try {
      bloc.setIsLoading(true);
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithGoogle();
    } on Exception catch (e) {
      _showSignInError(context,e);
    } finally {
      bloc.setIsLoading(false);
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    final bloc = Provider.of<SignInBloc>(context, listen: false);
    try {
      bloc.setIsLoading(true);
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithFacebook();
    } on Exception catch (e) {
      _showSignInError(context,e);
    } finally {
      bloc.setIsLoading(false);
    }
  }

  void _signInWithEmail(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(),
      )//MaterialPageRoute
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<SignInBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 2.0,
      ), //AppBar
      body: StreamBuilder<bool>(
        stream: bloc.isLoadingStream,
        initialData: false,
        builder: (context, snapshot) {
          return _buildContent(context, snapshot.data);
        }
      ),
      backgroundColor: Colors.grey[200],
    ); //Scaffold
  }

  Widget _buildContent(BuildContext context, bool isLoading) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: SizedBox(
                height: 50.0,
                child: _buildHeader(isLoading),
            ),
          ),
          SizedBox(height: 48.0),
          SocialSignInButton(
            assetName: 'images/G.png',
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: isLoading ? null : () => _signInWithGoogle(context),
          ), //SignInButton
          SizedBox(height: 8.0,),
          SocialSignInButton(
            assetName: 'images/facebook.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xff334d92),
            onPressed: isLoading ? null : () => _signInWithFacebook(context),
          ), //SignInButton
          SizedBox(height: 8.0,),
          SignInButton(
            text: 'Sign in with email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: isLoading ? null : () => _signInWithEmail(context),
          ), //SignInButton
          SizedBox(height: 8.0,),
          Text(
            'or',
            style: TextStyle(fontSize: 14.0, color: Colors.black87),
            textAlign: TextAlign.center,
          ), //Text
          SizedBox(height: 8.0,),
          SignInButton(
            text: 'Go anonymous',
            textColor: Colors.black,
            color: Colors.lime[300],
            onPressed: isLoading ? null : () => _signInAnonymously(context),
          ), //SignInButton
        ], //<Widget>[]
      ),
    ); //Column
  }

  Widget _buildHeader(bool isLoading) {
    if(isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text(
        'Sign in',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.w600,
        ), //TextStyle
      );
  }
}