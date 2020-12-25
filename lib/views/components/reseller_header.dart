import 'package:bms_electric/views/screens/edit_reseller/edit_reseller_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class ResellerHeader extends StatelessWidget {
  final firstName, lastName, phone, storeName;

  const ResellerHeader(
      {this.firstName, this.lastName, this.phone, this.storeName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${this.firstName} ${this.lastName}",
            style: TextStyle(color: Colors.white, fontSize: 18),
            overflow: TextOverflow.fade,
          ),
          SizedBox(height: 10),
          Text(
            "${this.phone}",
            style: TextStyle(color: secondaryColor),
            overflow: TextOverflow.fade,
          ),
          SizedBox(height: 20),
          Text(
            "${this.storeName}",
            style: TextStyle(color: secondaryColor, fontSize: 18),
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }
}
