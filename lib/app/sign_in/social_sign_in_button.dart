import 'package:flutter/material.dart';
import 'package:mypill/common_widgets/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton{
  SocialSignInButton({
    String assetName,
    String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  }) :super(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget> [
        Image.asset(assetName),
        Text(
          text,
          style: TextStyle(color: textColor,fontSize: 15.0),
        ),//Text
        Opacity(
          opacity: 0.0,
          child: Image.asset(assetName),
        ),//Opacity
      ],//<Widget>[]
    ),//Row
    color: color,
    onPressed: onPressed,
  );
}