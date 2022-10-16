import 'package:json_annotation/json_annotation.dart';

part 'drugs_item.g.dart';


@JsonSerializable()
class DrugsItem {

  @JsonKey(defaultValue: 0, name: "id")
  int id;

  @JsonKey(defaultValue: "", name: "name")
  String name;

  @JsonKey(defaultValue: 0.0, name: "price")
  double price;

  @JsonKey(defaultValue: 0.0, name: "quantity")
  double quantity;




  DrugsItem({
    required this.name,
    required this.id,
    required this.price,
    required this.quantity
  });

  factory DrugsItem.fromJson(Map<String, dynamic> json) =>
      _$DrugsItemFromJson(json);

  Map<String, dynamic> toJson() => _$DrugsItemToJson(this);
}