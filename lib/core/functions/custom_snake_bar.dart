import 'package:flutter/material.dart';

void snakeBar(context, String text) {
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text( 'cannot launch $text')));
}
