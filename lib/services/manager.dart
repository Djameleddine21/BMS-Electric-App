import 'package:bms_electric/models/resseler/reseller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Manager {
  Reseller selectedReseller;

  Manager._();

  static final instance = Manager._();

  Future addReseller(
      String name,
      String storeName,
      String phone,
      double longitude,
      double latitude,
      String address,
      String wilaya,
      int activity) async {
    DocumentReference doc =
        await FirebaseFirestore.instance.collection("resellers").add(
      {
        "name": name,
        "wilaya": wilaya,
        "phone": phone,
        "storeName": storeName,
        "longitude": longitude,
        "latitude": latitude,
        "address": address,
        "rate": 0,
        "evaluation": "",
        "activity": activity,
      },
    );
    print(doc);
  }

  Future getAllResellers() async {
    List<Reseller> list = [];
    QuerySnapshot collection =
        await FirebaseFirestore.instance.collection("resellers").get();
    collection.docs.forEach((element) {
      list.add(Reseller.fromJson(element.data())..id = element.id);
    });
    return list;
  }

  Future editProfile(
      String name,
      String storeName,
      String phone,
      double longitude,
      double latitude,
      String address,
      String wilaya,
      int activity) async {
    FirebaseFirestore.instance
        .collection("resellers")
        .doc(selectedReseller.id)
        .update({
      "name": name,
      "wilaya": wilaya,
      "phone": phone,
      "storeName": storeName,
      "longitude": longitude,
      "latitude": latitude,
      "address": address,
      "activity": activity,
    });
  }
}
