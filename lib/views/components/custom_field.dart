import 'package:bms_electric/constants.dart';
import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final Widget textField;

  const CustomField({@required this.textField}) : assert(textField != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: [
          Container(
            height: 55.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: secondaryColor,
            ),
            alignment: Alignment(-0.96, 0.0),
            child: Icon(Icons.person_outline, color: Colors.white, size: 30.0),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: textField,
          ),
        ],
      ),
    );
  }
}
