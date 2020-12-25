import 'package:bms_electric/constants.dart';
import 'package:bms_electric/views/components/bms_header.dart';
import 'package:bms_electric/views/components/custom_button.dart';
import 'package:bms_electric/views/components/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends StatelessWidget {
  static const String id = '/auth';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //header
              BmsHeader(),
              SizedBox(height: Get.height * 0.1),
              //input phone
              CustomField(
                textField: TextField(
                  style: TextStyle(color: primaryColor),
                  decoration:
                      inputDecoration.copyWith(hintText: "Numéro de Téléphone"),
                  keyboardType: TextInputType.phone,
                ),
              ),
              SizedBox(height: Get.height * 0.15),
              //login button
              CustomButton(text: "S'identifier", onTap: () {}),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
