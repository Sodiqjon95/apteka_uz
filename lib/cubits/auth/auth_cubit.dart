import 'package:apteka_uz/data/repositories/products_repository.dart';
import 'package:apteka_uz/utils/utility_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.productsRepository}) : super(SignInState());
  ProductsRepository productsRepository;

  changeState(AuthState newState) {
    emit(newState);
  }

  Future signUp(
      {required BuildContext context,
      required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String phoneNumber}) async {
    if (firstName.isNotEmpty && email.length > 3 && password.length > 5) {
      productsRepository.signUp(
        lastName: lastName,
        phoneNumber: phoneNumber,
        firstName: firstName,
        email: email,
        password: password,
      );

      UtilityFunctions.getMyToast(message: "Registered successfully");

      emit(AuthSuccesses());
    } else if (email.isEmpty && firstName.isEmpty && password.isEmpty) {
      UtilityFunctions.getMyToast(message: "Please,enter your infos");
    } else if (email.length <= 3) {
      UtilityFunctions.getMyToast(message: "Enter again your email");
    } else if (firstName.isEmpty) {
      UtilityFunctions.getMyToast(message: "Enter your firstName");
    } else if (password.length <= 5) {
      UtilityFunctions.getMyToast(message: "Minimum length for password: 6");
    }
  }

  Future signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    if (email.length > 3 && password.length > 5) {
      productsRepository.signIn(
        email: email,
        password: password,
      );
      UtilityFunctions.getMyToast(message: "Login successfully");
      emit(AuthSuccesses());
    } else {
      UtilityFunctions.getMyToast(message: "Re-enter your infos!");
    }
  }
}
