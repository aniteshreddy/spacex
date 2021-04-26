import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:leanix/presentation/screens/DetailsScreens/links.dart';

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

