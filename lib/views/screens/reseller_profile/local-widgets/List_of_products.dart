import 'package:bms_electric/models/product.dart';
import 'package:bms_electric/views/screens/reseller_profile/local-widgets/single_product.dart';
import 'package:flutter/material.dart';

class ListOfProducts extends StatelessWidget {
  final List<Product> products;
  ListOfProducts({this.products});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.23,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) => SingleProduct(product: products[i]),
        itemCount: products.length,
      ),
    );
  }
}
