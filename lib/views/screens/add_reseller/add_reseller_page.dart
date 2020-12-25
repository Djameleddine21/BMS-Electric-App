import 'package:bms_electric/constants.dart';
import 'package:bms_electric/views/components/clipper/side_wave.dart';
import 'package:bms_electric/views/components/custom_button.dart';
import 'package:bms_electric/views/components/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddResellerPage extends StatelessWidget {
  static const id = "/home/addReseller";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: SideWave(),
            child: Container(
              color: primaryColor,
              height: Get.height,
              width: Get.width,
            ),
          ),
          SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 70.0 * 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomField(
                        icon: Icon(Icons.person_outline,
                            color: Colors.white, size: 30.0),
                        textField: TextField(
                          style: TextStyle(color: primaryColor),
                          decoration: inputDecoration.copyWith(
                              hintText: "Nom et prénom"),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      CustomField(
                        icon: Image.asset("assets/icons/store.png"),
                        textField: TextField(
                          style: TextStyle(color: primaryColor),
                          decoration: inputDecoration.copyWith(
                              hintText: "Nom du store"),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      CustomField(
                        icon:
                            Icon(Icons.phone, color: Colors.white, size: 30.0),
                        textField: TextField(
                          style: TextStyle(color: primaryColor),
                          decoration: inputDecoration.copyWith(
                              hintText: "Numéro de téléphone"),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      CustomField(
                        icon: Image.asset("assets/icons/mail.png"),
                        textField: TextField(
                          style: TextStyle(color: primaryColor),
                          decoration: inputDecoration.copyWith(
                              hintText: "Adresse email"),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      CustomField(
                        icon: Image.asset("assets/icons/home.png"),
                        textField: TextField(
                          style: TextStyle(color: primaryColor),
                          decoration:
                              inputDecoration.copyWith(hintText: "Adresse"),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    FittedBox(
                      child: Text(
                        "Cliquez ici pour avoir l'adresse exacte",
                        style: TextStyle(
                          color: secondaryColor,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Text("Lat: "),
                          Expanded(
                            child: Text(
                              "0.515184184984 ",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          VerticalDivider(
                            color: primaryColor,
                            thickness: 2,
                            width: 2,
                            indent: 10,
                            endIndent: 10,
                          ),
                          Text(" Lng: "),
                          Expanded(
                            child: Text(
                              "0.515184184984",
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                CustomButton(text: "Ajouter", onTap: null)
              ],
            ),
          )
        ],
      ),
    ));
  }
}
