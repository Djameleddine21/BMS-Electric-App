import 'package:bms_electric/constants.dart';
import 'package:bms_electric/services/location.dart';
import 'package:bms_electric/services/manager.dart';
import 'package:bms_electric/views/components/clipper/side_wave.dart';
import 'package:bms_electric/views/components/custom_button.dart';
import 'package:bms_electric/views/components/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class AddResellerPage extends StatefulWidget {
  static const id = "/home/addReseller";

  @override
  _AddResellerPageState createState() => _AddResellerPageState();
}

class _AddResellerPageState extends State<AddResellerPage> {
  var name;

  var wilaya;

  var phone;

  var storeName;

  var address;
  var dropDown = 1;

  LocationData data = LocationData.fromMap({"latitude": 0.0, "longitude": 0.0});

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
                                hintText: "Nom et prénom"),
                            keyboardType: TextInputType.text,
                            onChanged: (value) => name = value,
                          ),
                        ),
                        CustomField(
                          icon: Image.asset("assets/icons/store.png"),
                          textField: TextField(
                            style: TextStyle(color: primaryColor),
                            decoration: inputDecoration.copyWith(
                                hintText: "Nom du store"),
                            keyboardType: TextInputType.text,
                            onChanged: (value) => storeName = value,
                          ),
                        ),
                        CustomField(
                          icon: Icon(Icons.phone,
                              color: Colors.white, size: 30.0),
                          textField: TextField(
                            style: TextStyle(color: primaryColor),
                            decoration: inputDecoration.copyWith(
                                hintText: "Numéro de téléphone"),
                            keyboardType: TextInputType.phone,
                            onChanged: (value) => phone = value,
                          ),
                        ),
                        CustomField(
                          icon: Icon(Icons.location_on,
                              color: Colors.white, size: 30.0),
                          textField: TextField(
                            style: TextStyle(color: primaryColor),
                            decoration:
                                inputDecoration.copyWith(hintText: "Wilaya"),
                            keyboardType: TextInputType.number,
                            onChanged: (value) => wilaya = value,
                          ),
                        ),
                        CustomField(
                          icon: Image.asset("assets/icons/home.png"),
                          textField: TextField(
                            style: TextStyle(color: primaryColor),
                            decoration:
                                inputDecoration.copyWith(hintText: "Adresse"),
                            keyboardType: TextInputType.text,
                            onChanged: (value) => address = value,
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
                        value: dropDown,
                        items: [
                          DropdownMenuItem(
                              value: 1, child: Text("Quincaillerie")),
                          DropdownMenuItem(
                              value: 2, child: Text("Eléctricien")),
                          DropdownMenuItem(value: 3, child: Text("Grossiste"))
                        ],
                        onChanged: (value) {
                          setState(() {
                            dropDown = value;
                          });
                        }),
                  ),
                  Column(
                    children: [
                      FittedBox(
                        child: InkWell(
                          onTap: () async {
                            data = await LocationService.instance.getLocation();
                            setState(() {});
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
                                data.latitude.toString(),
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
                                data.longitude.toString(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  CustomButton(
                    text: "Ajouter",
                    onTap: () async {
                      await Manager.instance.addReseller(
                          name,
                          storeName,
                          phone,
                          data.longitude,
                          data.latitude,
                          address,
                          wilaya,
                          dropDown);
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
