import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mypill/services/auth.dart';
import 'package:provider/provider.dart';
import 'MainScreen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        //debugShowCheckedModeBanner: false,
        title: 'MyPill',
        theme: ThemeData(
          primaryColor: new Color(0xff622F74),
        ),
        home: MainScreen(),
      ),
    );
  }
}