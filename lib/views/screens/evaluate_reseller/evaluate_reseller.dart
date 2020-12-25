import 'package:bms_electric/views/components/reseller_header.dart';
import 'package:bms_electric/views/screens/edit_reseller/edit_reseller_page.dart';
import 'package:bms_electric/views/screens/reseller_profile/local-widgets/List_of_products.dart';
import 'package:bms_electric/views/screens/reseller_profile/local-widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class EvaluateReseller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: primaryColor,
          padding: EdgeInsets.only(top: 30, left: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: ResellerHeader()),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(40.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20),
                    child: ListView(
                      children: [
                        Text("Evaluer ce vendeur"),
                        SizedBox(height: 20),
                        RatingBar.builder(
                          itemSize: 50,
                          glow: false,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(height: 50),
                        Text('Rapport et commentaire'),
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.grey[300],
                          ),
                          child: TextField(
                            minLines: 10,
                            maxLines: 10,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Rapport et commentaire',
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: InkWell(
                            onTap: () {},
                            child: CustomButtom(
                              text: 'Evaluer',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
