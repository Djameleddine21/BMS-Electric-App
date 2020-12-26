import 'dart:io';

import 'package:bms_electric/constants.dart';
import 'package:bms_electric/helpers/helper.dart';
import 'package:bms_electric/models/product.dart';
import 'package:bms_electric/models/resseler/reseller.dart';
import 'package:bms_electric/services/manager.dart';
import 'package:bms_electric/views/components/reseller_header.dart';
import 'package:bms_electric/views/screens/edit_reseller/edit_reseller_page.dart';
import 'package:bms_electric/views/screens/evaluate_reseller/evaluate_reseller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'local-widgets/List_of_products.dart';
import 'local-widgets/custom_button.dart';

class ResellerProfilePage extends StatefulWidget {
  static const id = "reseller_profile";
  @override
  _ResellerProfilePageState createState() => _ResellerProfilePageState();
}

class _ResellerProfilePageState extends State<ResellerProfilePage> {
  File _image;

  List<Product> bmsProducts;
  List<Product> nonBmsProducts;

  Reseller reseller;

  Future getImage(ImageSource imageSource) async {
    // ignore: deprecated_member_use
    final pickedFile = await ImagePicker.pickImage(source: imageSource);
    setState(() {
      _image = pickedFile;
      // controller = TextEditingController(text: _image.path);
    });
  }

  void _buildAddProduct() {
    Get.defaultDialog(
      title: "",
      content: SingleChildScrollView(
        child: Column(
          children: [
            _image == null
                ? InkWell(
                    onTap: _buildBottomSheetForPicture,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: Image.asset('assets/icons/camera.png',
                          color: primaryColor),
                      radius: 50,
                    ),
                  )
                : CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child: Stack(
                      alignment: Alignment.center,
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Container(
                          height: 95,
                          width: 95,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.file(
                              _image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -4,
                          right: -4,
                          child: SizedBox(
                            height: 24.0,
                            width: 24.0,
                            child: FloatingActionButton(
                              backgroundColor: primaryColor,
                              elevation: 1.0,
                              onPressed: () {
                                setState(() {
                                  _image = null;
                                });
                              },
                              child: Icon(
                                Icons.cancel,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    radius: 50,
                  ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.grey[300],
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nom du produit',
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: CustomButtom(
                text: 'Ajouter',
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildBottomSheetForPicture() {
    Get.bottomSheet(Container(
      color: Colors.white,
      height: 130,
      padding: EdgeInsets.symmetric(horizontal: 22.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 19.0),
          InkWell(
            onTap: () {
              getImage(ImageSource.camera);
              Navigator.pop(context);
            },
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                  size: 24,
                ),
                SizedBox(width: 38.0),
                Text(
                  "Camera",
                ),
              ],
            ),
          ),
          SizedBox(height: 37.0),
          InkWell(
            onTap: () {
              getImage(ImageSource.gallery);
              Navigator.pop(context);
            },
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.image,
                  color: Colors.black,
                  size: 24,
                ),
                SizedBox(width: 38.0),
                Text(
                  'gallerie',
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  @override
  void initState() {
    List<Product> products = [
      Product(
          name: "Schneider",
          imageUrl:
              "https://download.schneider-electric.com/files?p_Doc_Ref=PB112480&p_File_Type=rendition_369_jpg",
          isFromBMS: true),
      Product(
          name: "Fauteuil roulant",
          imageUrl:
              "https://img.medicalexpo.fr/images_me/photo-mg/76562-14592039.jpg",
          isFromBMS: true),
      Product(
          name: "Moteur",
          imageUrl:
              "https://www.pedrollo.com/public/images/products/PQ.jpg?width=500&height=500&bgcolor=ffffff&scale=both",
          isFromBMS: true),
      Product(
          name: "Prise",
          imageUrl:
              "https://zakawatt.dz/wp-content/uploads/2018/05/Prise-simple-Eco-BMS.jpg",
          isFromBMS: true),
      Product(
          name: "Oven",
          imageUrl:
              "https://www.sotech-international.com/3963-thickbox_default/electric-oven-26l.jpg",
          isFromBMS: true),
      Product(
          name: "Kettle",
          imageUrl:
              "https://pyxis.nymag.com/v1/imgs/6e8/a53/cafdf9c99ab179e3b8a02b8ca3645acf02-electric-kettle-lede.rsquare.w700.jpg",
          isFromBMS: false),
      Product(
          name: "Dualtron",
          imageUrl:
              "https://cdn.shopify.com/s/files/1/0018/7616/4681/products/Dualtron_3_Electric_Scooter_Overhead_Profile_1600x.jpg?v=1599746538",
          isFromBMS: false),
      Product(
          name: "vélo",
          imageUrl:
              "https://i.pinimg.com/736x/7c/ae/9a/7cae9ab24847e6e13ed1eef219bafa0f.jpg",
          isFromBMS: false),
    ];
    bmsProducts = products.where((p) => p.isFromBMS).toList();
    nonBmsProducts = products.where((p) => !p.isFromBMS).toList();
    reseller = Manager.instance.selectedReseller;
    super.initState();
  }

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
                  Expanded(
                      child: ResellerHeader(
                    name: reseller.name,
                    phone: reseller.phone,
                    storeName: getActivityFromInt(reseller.activity),
                  )),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                Get.to(EditResellerPage());
                              },
                              child: Image.asset('assets/icons/edit.png')),
                          SizedBox(height: 20),
                          RatingBar.builder(
                            itemSize: 25,
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
                            onRatingUpdate: null,
                          ),
                        ],
                      ),
                    ),
                  ),
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
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Produits de BMS',
                                style: TextStyle(
                                    color: primaryColor, fontSize: 20),
                              ),
                              InkWell(
                                onTap: () {
                                  _buildAddProduct();
                                },
                                child: Text(
                                  '+ Ajouter',
                                  style: TextStyle(
                                      color: secondaryColor, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        ListOfProducts(
                          products: bmsProducts,
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Autre produits',
                                style: TextStyle(
                                    color: primaryColor, fontSize: 20),
                              ),
                              InkWell(
                                onTap: () {
                                  _buildAddProduct();
                                },
                                child: Text(
                                  '+ Ajouter',
                                  style: TextStyle(
                                      color: secondaryColor, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        ListOfProducts(
                          products: nonBmsProducts,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(EvaluateReseller());
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: size.width * 0.6,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/icons/logo.png'),
                                SizedBox(width: 5),
                                Text(
                                  'Evaluer',
                                  style: TextStyle(
                                      color: secondaryColor, fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        )
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
