// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drugs_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrugsItem _$DrugsItemFromJson(Map<String, dynamic> json) => DrugsItem(
      name: json['name'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$DrugsItemToJson(DrugsItem instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'quantity': instance.quantity,
    };
