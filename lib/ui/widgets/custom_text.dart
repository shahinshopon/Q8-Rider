import 'package:flutter/material.dart';

Widget customText(text) {
  return Container(
      padding: EdgeInsets.only(top: 15),
      child: Text(text,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)));
}
