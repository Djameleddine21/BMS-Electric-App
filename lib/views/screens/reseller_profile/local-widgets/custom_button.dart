import 'package:flutter/material.dart';

import '../../../../constants.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  CustomButtom({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(color: secondaryColor, fontSize: 20),
          )
        ],
      ),
    );
  }
}
