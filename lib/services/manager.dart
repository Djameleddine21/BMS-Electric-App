import 'package:cloud_firestore/cloud_firestore.dart';

class Manager {
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
}
