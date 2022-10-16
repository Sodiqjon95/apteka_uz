import 'package:json_annotation/json_annotation.dart';

part 'users_item.g.dart';

@JsonSerializable()
class UsersItem {
  @JsonKey(defaultValue: 0, name: "id")
  int id;

  @JsonKey(defaultValue: "", name: "firstName")
  String firstName;

  @JsonKey(defaultValue: "", name: "lastName")
  String lastName;

  @JsonKey(defaultValue: "", name: "imageUrl")
  String imageUrl;

  @JsonKey(defaultValue: "", name: "email")
  String email;

  @JsonKey(defaultValue: "", name: "emailConfirmed")
  String emailConfirmed;

  @JsonKey(defaultValue: 0, name: "phoneNumber")
  int phoneNumber;

  @JsonKey(defaultValue: 0, name: "role")
  int role;

  UsersItem({
    required this.id,
    required this.phoneNumber,
    required this.imageUrl,
    required this.firstName,
    required this.email,
    required this.emailConfirmed,
    required this.lastName,
    required this.role,
  });

  factory UsersItem.fromJson(Map<String, dynamic> json) => _$UsersItemFromJson(json);

  Map<String, dynamic> toJson() => _$UsersItemToJson(this);
}
