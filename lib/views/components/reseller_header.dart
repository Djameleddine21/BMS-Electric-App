import 'package:flutter/material.dart';

import '../../constants.dart';

class ResellerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Younes Mimene",
            style: TextStyle(color: Colors.white, fontSize: 18),
            overflow: TextOverflow.fade,
          ),
          SizedBox(height: 10),
          Text(
            "0612345678",
            style: TextStyle(color: secondaryColor),
            overflow: TextOverflow.fade,
          ),
          SizedBox(height: 20),
          Text(
            "Nom du store",
            style: TextStyle(color: secondaryColor, fontSize: 18),
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }
}
