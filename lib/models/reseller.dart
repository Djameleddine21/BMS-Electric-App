import 'package:bms_electric/models/product.dart';
import 'package:get/get.dart';

class Reseller {
  final firstName;
  final lastName;
  final phone;
  final descripton;
  final longitute;
  final latitude;
  final adress;
  final wilaya;
  final rate;
  final List<Product> products;
  Reseller({
    this.adress,
    this.descripton,
    this.firstName,
    this.lastName,
    this.latitude,
    this.longitute,
    this.phone,
    this.rate,
    this.wilaya,
    this.products,
  });
}
