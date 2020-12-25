import 'package:bms_electric/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onTap;

  const CustomButton({@required this.text, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: RaisedButton(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(images + 'logo.png'),
            Text(
              text ?? "",
              style:
                  TextStyle(color: secondaryColor, fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ],
        ),
        onPressed: onTap ?? () {},
      ),
    );
  }
}
