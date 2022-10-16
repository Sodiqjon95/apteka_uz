// [
// {
// "id": 4,
// "firstName": "first",
// "lastName": "name",
// "imageUrl": "https://pharmacy-db-demo.herokuapp.com//Images/IMG_c7147286-7d41-4307-a0a2-69531c5dc0d8photo_2022-04-15_08-41-08.jpg",
// "email": "dvgh@gmail.com",
// "emailConfirmed": false,
// "phoneNumber": "+998997889878",
// "role": 1
// },
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

  @JsonKey(defaultValue: 0, name: "price")
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
