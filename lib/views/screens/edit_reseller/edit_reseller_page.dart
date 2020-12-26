import 'package:bms_electric/constants.dart';
import 'package:bms_electric/services/location.dart';
import 'package:bms_electric/services/manager.dart';
import 'package:bms_electric/views/components/clipper/side_wave.dart';
import 'package:bms_electric/views/components/custom_button.dart';
import 'package:bms_electric/views/components/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class EditResellerPage extends StatefulWidget {
  static const id = "/edit";

  @override
  _EditResellerPageState createState() => _EditResellerPageState();
}

class _EditResellerPageState extends State<EditResellerPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ClipPath(
              clipper: SideWave(),
              child: Container(
                color: primaryColor,
                height: Get.height,
                width: Get.width,
              ),
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SizedBox(
              height: Get.height - Get.statusBarHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 65.0 * 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomField(
                          icon: Icon(Icons.person_outline,
                              color: Colors.white, size: 30.0),
                          textField: TextField(
                              style: TextStyle(color: primaryColor),
                              decoration: inputDecoration.copyWith(
                                  hintText:
                                      Manager.instance.selectedReseller.name),
                              keyboardType: TextInputType.text,
                              onChanged: (value) => Manager
                                  .instance.selectedReseller.name = value),
                        ),
                        CustomField(
                          icon: Image.asset("assets/icons/store.png"),
                          textField: TextField(
                            style: TextStyle(color: primaryColor),
                            decoration: inputDecoration.copyWith(
                                hintText: Manager
                                    .instance.selectedReseller.storeName),
                            keyboardType: TextInputType.text,
                            onChanged: (value) => Manager
                                .instance.selectedReseller.storeName = value,
                          ),
                        ),
                        CustomField(
                          icon: Icon(Icons.phone,
                              color: Colors.white, size: 30.0),
                          textField: TextField(
                            style: TextStyle(color: primaryColor),
                            decoration: inputDecoration.copyWith(
                                hintText:
                                    Manager.instance.selectedReseller.phone),
                            keyboardType: TextInputType.phone,
                            onChanged: (value) =>
                                Manager.instance.selectedReseller.phone = value,
                          ),
                        ),
                        CustomField(
                          icon: Icon(Icons.location_on,
                              color: Colors.white, size: 30.0),
                          textField: TextField(
                            style: TextStyle(color: primaryColor),
                            decoration: inputDecoration.copyWith(
                                hintText:
                                    Manager.instance.selectedReseller.wilaya),
                            keyboardType: TextInputType.number,
                            onChanged: (value) => Manager
                                .instance.selectedReseller.wilaya = value,
                          ),
                        ),
                        CustomField(
                          icon: Image.asset("assets/icons/home.png"),
                          textField: TextField(
                            style: TextStyle(color: primaryColor),
                            decoration: inputDecoration.copyWith(
                                hintText:
                                    Manager.instance.selectedReseller.address),
                            keyboardType: TextInputType.text,
                            onChanged: (value) => Manager
                                .instance.selectedReseller.address = value,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: greyColor),
                    child: DropdownButton(
                        value: Manager.instance.selectedReseller.activity,
                        items: [
                          DropdownMenuItem(
                              value: 1, child: Text("Quincaillerie")),
                          DropdownMenuItem(
                              value: 2, child: Text("Eléctricien")),
                          DropdownMenuItem(value: 3, child: Text("Grossiste"))
                        ],
                        onChanged: (value) {
                          setState(() {
                            Manager.instance.selectedReseller.activity = value;
                          });
                        }),
                  ),
                  Column(
                    children: [
                      FittedBox(
                        child: InkWell(
                          onTap: () async {
                            LocationData data =
                                await LocationService.instance.getLocation();
                            setState(() {
                              Manager.instance.selectedReseller.longitude =
                                  data.longitude;
                              Manager.instance.selectedReseller.latitude =
                                  data.latitude;
                            });
                          },
                          child: Text(
                            "Cliquez ici pour avoir l'adresse exacte",
                            style: TextStyle(
                              color: secondaryColor,
                              fontSize: 17,
                            ),
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
                                Manager.instance.selectedReseller.latitude
                                    .toString(),
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
                                Manager.instance.selectedReseller.longitude
                                    .toString(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  CustomButton(
                    text: "Modifier",
                    onTap: () async {
                      await Manager.instance.editProfile(
                          Manager.instance.selectedReseller.name,
                          Manager.instance.selectedReseller.storeName,
                          Manager.instance.selectedReseller.phone,
                          Manager.instance.selectedReseller.longitude,
                          Manager.instance.selectedReseller.latitude,
                          Manager.instance.selectedReseller.address,
                          Manager.instance.selectedReseller.wilaya,
                          Manager.instance.selectedReseller.activity);
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
