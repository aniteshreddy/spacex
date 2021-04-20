import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:leanix/DetailsScreens/links.dart';

Widget heading(String heading) {
  return Center(
      child: Text(
    heading,
    style: TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
  ));
}

TextStyle textstyle = TextStyle(
  letterSpacing: 1,
  color: Colors.white,
  height: 1.5, fontSize: (13),
  //fontWeight: FontWeight.bold,
);

Widget links(final item,String name,String sub) {
  return item[name] != null
      ? RichText(
          text: TextSpan(
          children: [
            TextSpan(
                style: textstyle,
                text: "$sub: \n"),
            TextSpan(
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  letterSpacing: 1,
                  color: Colors.blue,
                  height: 1.5, fontSize: (14),
                  //fontWeight: FontWeight.bold,
                ),
                text: item[name],
                recognizer: TapGestureRecognizer()
                  ..onTap = () => launchURL(item[name])),
          ],
        ))
      : SizedBox();
}