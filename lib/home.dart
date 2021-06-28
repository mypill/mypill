
import 'package:flutter/material.dart';
import 'package:mypill/common_widgets/show_alert_dialog.dart';
import 'package:mypill/services/auth.dart';
import 'package:provider/provider.dart';
import 'nav.dart';
class Home extends StatelessWidget {

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
       await auth.signOut();
    } catch (e){
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(
        context,
        title: 'Logout',
        content: 'Are you sure that you want to logout?',
        cancelActionText: 'Cancel',
        defaultActionText: 'Logout',
    );
    if(didRequestSignOut == true){
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey,
        actions: [
          /*IconButton(
            icon: Icon(Icons.account_circle),
            iconSize: 40,
            onPressed: () =>{
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Profile())
              ),
            },
          ),*/
          FlatButton(
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),//TextStyle
              ),//Text
            onPressed: () => _confirmSignOut(context),
          ),//FlatButton
        ],
      ),
      body: MyBottomNavigationBarState (),


    );
  }
}
