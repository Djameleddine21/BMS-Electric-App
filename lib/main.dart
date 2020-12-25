import 'package:bms_electric/views/routes/routes.dart';
import 'package:bms_electric/views/screens/auth/auth_page.dart';
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
      defaultTransition: Transition.cupertino,
      getPages: pages,
      initialRoute: AuthPage.id,
    );
  }
}
