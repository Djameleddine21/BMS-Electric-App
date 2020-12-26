import 'package:flutter/material.dart';

import '../../constants.dart';

class ResellerHeader extends StatelessWidget {
  final name, phone, storeName;

  const ResellerHeader({this.name, this.phone, this.storeName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Djamel",
            style: TextStyle(color: Colors.white, fontSize: 18),
            overflow: TextOverflow.fade,
          ),
          SizedBox(height: 10),
          Text(
            "0658363772",
            style: TextStyle(color: secondaryColor),
            overflow: TextOverflow.fade,
          ),
          SizedBox(height: 20),
          Text(
            "Quincaillerie",
            style: TextStyle(color: secondaryColor, fontSize: 18),
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }
}
