// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reseller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reseller _$ResellerFromJson(Map<String, dynamic> json) {
  return Reseller(
    name: json['name'] as String,
    address: json['address'] as String,
    phone: json['phone'] as String,
    storeName: json['storeName'] as String,
    evaluation: json['evaluation'] as String,
    rate: (json['rate'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    latitude: (json['latitude'] as num)?.toDouble(),
    activity: json['activity'] as int,
    wilaya: json['wilaya'] as String,
  );
}

Map<String, dynamic> _$ResellerToJson(Reseller instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'wilaya': instance.wilaya,
      'storeName': instance.storeName,
      'evaluation': instance.evaluation,
      'rate': instance.rate,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'activity': instance.activity,
    };
