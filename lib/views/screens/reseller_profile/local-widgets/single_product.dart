import 'package:bms_electric/views/screens/reseller_profile/local-widgets/custom_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';

class SingleProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      width: size.height * 0.2 * 0.9,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(width: 0.5),
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://dz.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/83/9002/1.jpg?1746',
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        border: Border.all(width: 0.3),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter:
                              ColorFilter.mode(Colors.red, BlendMode.colorBurn),
                        ),
                      ),
                    ),
                    errorWidget: (context, err, _) => Container(
                      child: Image.asset('assets/icons/image.png'),
                    ),
                    progressIndicatorBuilder: (conext, build, progress) =>
                        Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Center(
                      child: Text(
                    'Product name',
                    style: TextStyle(color: secondaryColor),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                  )),
                ),
              ),
            ],
          ),
          Positioned(
            left: 5,
            top: 5,
            child: InkWell(
              onTap: () {
                Get.defaultDialog(
                  title: 'Confirmation',
                  content: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                              'Etes-vous sur de vouloir supprimer ce produit ?'),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {},
                          child: CustomButtom(
                            text: 'Oui',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Image.asset('assets/icons/delete.png'),
            ),
          )
        ],
      ),
    );
  }
}
