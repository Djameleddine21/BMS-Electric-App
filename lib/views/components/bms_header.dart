import 'package:bms_electric/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BmsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: Get.height * 0.3 - 75),
            ClipOval(
              child: Container(height: 150.0, width: Get.width, color: primaryColor),
            ),
          ],
        ),
        Container(
          height: Get.height * 0.3,
          width: Get.width,
          color: primaryColor,
          child: Image.asset(images + "BMS.png", height: Get.height * 0.2),
        ),
      ],
    );
  }
}
