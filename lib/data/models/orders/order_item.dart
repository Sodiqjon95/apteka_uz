import 'package:json_annotation/json_annotation.dart';

part 'order_item.g.dart';

@JsonSerializable()
class OrderItem {
  @JsonKey(defaultValue: "", name: "drugName")
  String drugName;

  @JsonKey(defaultValue: "", name: "userFullName")
  String userFullName;

  @JsonKey(defaultValue: 0, name: "quantity")
  int quantity;

  @JsonKey(defaultValue: "", name: "date")
  String date;

  @JsonKey(defaultValue: 0, name: "paymentType")
  int paymentType;

  @JsonKey(defaultValue: 0, name: "cardNumber")
  int cardNumber;

  OrderItem({required this.userFullName, required this.quantity, required this.date, required this.cardNumber, required this.drugName, required this.paymentType});

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}
