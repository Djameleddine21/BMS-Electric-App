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
  // edit reseller
  GetPage(name: EditResellerPage.id, page: () => EditResellerPage()),
];
