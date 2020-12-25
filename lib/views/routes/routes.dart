import 'package:bms_electric/views/screens/auth/auth_page.dart';
import 'package:bms_electric/views/screens/home/home_page.dart';
import 'package:bms_electric/views/screens/reseller_profile/reseller_profile_page.dart';
import 'package:get/get.dart';

List<GetPage> pages = <GetPage>[
  //auth page
  GetPage(name: AuthPage.id, page: () => AuthPage()),
  //home page
  GetPage(name: HomePage.id, page: () => HomePage()),
  //reseller profile page
  GetPage(name: ResellerProfilePage.id, page: () => ResellerProfilePage()),
];
