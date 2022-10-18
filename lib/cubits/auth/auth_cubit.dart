import 'package:apteka_uz/utils/utility_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(SignInState());
  // ProductsRepository productsRepository;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  changeState(AuthState newState) {
    emit(newState);
  }

  Future signUp(context) async {
    if (usernameController.text.isNotEmpty &&
        emailController.text.length > 3 &&
        passwordController.text.length > 5) {
      // productsRepository.signUp(
      //   userName: usernameController.text,
      //   email: emailController.text,
      //   password: passwordController.text,
      // );

      UtilityFunctions.getMyToast(message: "Registered successfully");
      usernameController.clear();
      emailController.clear();
      passwordController.clear();
      emit(AuthSuccesses());
    } else if (emailController.text.isEmpty &&
        usernameController.text.isEmpty &&
        passwordController.text.isEmpty) {
      UtilityFunctions.getMyToast(message: "Please,enter your infos");
    } else if (emailController.text.length <= 3) {
      UtilityFunctions.getMyToast(message: "Enter again your email");
    } else if (usernameController.text.isEmpty) {
      UtilityFunctions.getMyToast(message: "Enter your userName");
    } else if (passwordController.text.length <= 5) {
      UtilityFunctions.getMyToast(message: "Minimum length for password: 6");
    }
  }

  Future signIn(context) async {
    if (emailController.text.length > 3 && passwordController.text.length > 5) {
      // productsRepository.signIn(
      //   email: emailController.text,
      //   password: passwordController.text,
      // );
      UtilityFunctions.getMyToast(message: "Login successfully");
      emit(AuthSuccesses());
      emailController.clear();
      passwordController.clear();
    } else {
      UtilityFunctions.getMyToast(message: "Re-enter your infos!");
    }
  }
}
