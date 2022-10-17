// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersItem _$UsersItemFromJson(Map<String, dynamic> json) => UsersItem(
      id: json['id'] as int? ?? 0,
      phoneNumber: json['phoneNumber'] as int? ?? 0,
      imageUrl: json['imageUrl'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      emailConfirmed: json['emailConfirmed'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      role: json['role'] as int? ?? 0,
    );

Map<String, dynamic> _$UsersItemToJson(UsersItem instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'imageUrl': instance.imageUrl,
      'email': instance.email,
      'emailConfirmed': instance.emailConfirmed,
      'phoneNumber': instance.phoneNumber,
      'role': instance.role,
    };
