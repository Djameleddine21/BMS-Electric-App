import 'package:flutter/material.dart';

///colors
const Color primaryColor = Color(0xff097185);
const Color secondaryColor = Color(0xffFFDE2D);
const Color greyColor = Color(0xffF2F2F2);

///const
String images = "assets/icons/";

//border
final OutlineInputBorder border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: BorderSide(color: Colors.transparent),
);

//input decoration of text fields
final InputDecoration inputDecoration = InputDecoration(
  fillColor: greyColor,
  focusColor: greyColor,
  hoverColor: greyColor,
  filled: true,
  hintStyle: TextStyle(color: primaryColor),
  enabledBorder: border,
  border: border,
  errorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red)),
  disabledBorder: border.copyWith(borderSide: BorderSide(color: Colors.white)),
  focusedBorder: border.copyWith(borderSide: BorderSide(color: Colors.white)),
);
