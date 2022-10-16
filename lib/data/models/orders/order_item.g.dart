// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      userFullName: json['userFullName'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 0,
      date: json['date'] as String? ?? '',
      cardNumber: json['cardNumber'] as int? ?? 0,
      drugName: json['drugName'] as String? ?? '',
      paymentType: json['paymentType'] as int? ?? 0,
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'drugName': instance.drugName,
      'userFullName': instance.userFullName,
      'quantity': instance.quantity,
      'date': instance.date,
      'paymentType': instance.paymentType,
      'cardNumber': instance.cardNumber,
    };
