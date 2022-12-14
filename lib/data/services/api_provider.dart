import 'dart:io';

import 'package:apteka_uz/data/local/storage/storage.dart';
import 'package:apteka_uz/data/models/products/product_item.dart';
import 'package:apteka_uz/data/models/users/users_item.dart';
import 'package:apteka_uz/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import 'api_client.dart';

class ApiProvider {
  ApiProvider({required this.apiClient, required this.storageRepository});

  ApiClient apiClient;
  StorageRepository storageRepository;

  Future<bool> deleteProductById({required String id}) async {
    try {
      Response response = await apiClient.dio
          .delete("${apiClient.dio.options.baseUrl}$drugs/$id");
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception();
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  Future<List<ProductItem>> getData() async {
    try {
      Response response =
          await apiClient.dio.get("${apiClient.dio.options.baseUrl}$drugs");
      if (response.statusCode == HttpStatus.ok) {
        List<ProductItem> products = (response.data as List?)
                ?.map((e) => ProductItem.fromJson(e))
                .toList() ??
            [];
        return products;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ProductItem> addData({
    required String name,
    required double price,
    required double quantity,
  }) async {
    try {
      Response response = await apiClient.dio
          .post("${apiClient.dio.options.baseUrl}$drugs", data: {
        "name": name,
        "price": price,
        "quantity": quantity,
      });
      if (response.statusCode == HttpStatus.ok) {
        return ProductItem.fromJson(response.data);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // -------------------------------------------    USERS     ----------------------------
  Future<List<UsersItem>> getAllUsers() async {
    try {
      Response response =
          await apiClient.dio.get("${apiClient.dio.options.baseUrl}$users");
      if (response.statusCode == HttpStatus.ok) {
        List<UsersItem> users = (response.data as List?)
                ?.map((e) => UsersItem.fromJson(e))
                .toList() ??
            [];
        return users;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // -------------------------------------------AUTHENTICATION----------------------------
  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    try {
      Response res = await apiClient.dio
          .post("${apiClient.dio.options.baseUrl}$register", data: {
        "firstName": firstName,
        "lastName": lastName,
        "image": "image.png",
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
        "role": 1,
      });

      if (res.statusCode == HttpStatus.ok) {
        storageRepository.storage.write("isRegistered", res.data);
      } else {
        throw Exception();
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      Response res = await apiClient.dio.post(
          "${apiClient.dio.options.baseUrl}$login",
          data: {"email": email, "password": password});
      if (res.statusCode == HttpStatus.ok) {
        debugPrint(res.data.toString());
        storageRepository.storage.write('token', res.data['token']);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
