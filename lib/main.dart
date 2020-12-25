import 'package:bms_electric/constants.dart';
import 'package:bms_electric/views/routes/routes.dart';

import 'package:bms_electric/views/screens/add_reseller/add_reseller_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BMSApp());
}

class BMSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMS Electric",
      theme: ThemeData(
        primaryColor: primaryColor,
        buttonColor: primaryColor,
        textTheme: TextTheme(bodyText2: TextStyle(color: primaryColor, fontSize: 18)),
        appBarTheme: AppBarTheme(centerTitle: true, color: primaryColor),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
        ),
        fontFamily: "Gotham",
      ),
      defaultTransition: Transition.cupertino,
      getPages: pages,

      initialRoute: AddResellerPage.id,

    );
  }
}
