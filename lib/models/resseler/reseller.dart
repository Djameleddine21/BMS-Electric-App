import 'package:json_annotation/json_annotation.dart';

part 'reseller.g.dart';

@JsonSerializable()
class Reseller {
  String name;
  String address;
  String id;
  String phone;
  String wilaya;
  String storeName;
  String evaluation;
  double rate;
  double longitude;
  double latitude;
  int activity;

  Reseller({
    this.name,
    this.address,
    this.phone,
    this.storeName,
    this.wilaya,
    this.evaluation,
    this.rate,
    this.longitude,
    this.latitude,
    this.activity,
  });

  factory Reseller.fromJson(Map<String, dynamic> json) =>
      _$ResellerFromJson(json);

  Map<String, dynamic> toJson() => _$ResellerToJson(this);
}
