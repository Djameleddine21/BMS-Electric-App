import 'package:bms_electric/constants.dart';
import 'package:bms_electric/views/components/bms_header.dart';
import 'package:bms_electric/views/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';

class ConfirmCodePage extends StatelessWidget {
  static const String id = '/confirm';

  final decoratin = BoxDecoration(
    borderRadius: BorderRadius.circular(8.0),
    color: greyColor,
  );

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
              //code input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PinPut(
                  fieldsCount: 6,
                  keyboardType: TextInputType.number,
                  selectedFieldDecoration: decoratin.copyWith(
                    border: Border.all(color: secondaryColor, width: 2.0),
                    color: greyColor,
                  ),
                  preFilledWidget: Text("-"),
                  disabledDecoration: decoratin,
                  submittedFieldDecoration: decoratin,
                  followingFieldDecoration: decoratin,
                ),
              ),
              SizedBox(height: Get.height * 0.15),
              //login button
              CustomButton(text: "Confirmer", onTap: () {}),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
