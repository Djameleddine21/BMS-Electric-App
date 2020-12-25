import 'package:bms_electric/views/screens/add_reseller/add_reseller_page.dart';
import 'package:bms_electric/views/screens/auth/auth_page.dart';
import 'package:bms_electric/views/screens/confirm_code/confirm_code_page.dart';
import 'package:bms_electric/views/screens/evaluate_reseller/evaluate_reseller.dart';
import 'package:bms_electric/views/screens/home/home_page.dart';
import 'package:bms_electric/views/screens/reseller_profile/reseller_profile_page.dart';
import 'package:get/get.dart';

import '../screens/add_reseller/add_reseller_page.dart';
import '../screens/auth/auth_page.dart';
import '../screens/edit_reseller/edit_reseller_page.dart';
import '../screens/home/home_page.dart';

List<GetPage> pages = <GetPage>[
  //auth page
  GetPage(name: AuthPage.id, page: () => AuthPage()),
  //home page
  GetPage(name: HomePage.id, page: () => HomePage()),
  // add reseller page
  GetPage(name: AddResellerPage.id, page: () => AddResellerPage()),
  //confirm otp code page
  GetPage(name: ConfirmCodePage.id, page: () => ConfirmCodePage()),
  // edit reseller
  GetPage(name: EditResellerPage.id, page: () => EditResellerPage()),
  // Reseller profile
  GetPage(name: ResellerProfilePage.id, page: () => ResellerProfilePage()),
  // Evaluate reseller profile
  GetPage(name: EvaluateReseller.id, page: () => EvaluateReseller()),
];
