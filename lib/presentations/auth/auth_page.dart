import 'package:apteka_uz/cubits/auth/auth_cubit.dart';
import 'package:apteka_uz/presentations/auth/login_screen/login_screen.dart';
import 'package:apteka_uz/presentations/auth/register_screen/register_screen.dart';
import 'package:apteka_uz/presentations/home_screen/home_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is SignInState) {
          return const LoginPage();
        } else if (state is SingUpState) {
          return const RegisterPage();
        } else if (state is AuthSuccesses) {
          return const MyHomePage();
        } else {
          return const Center(
            child: Text("AuthView"),
          );
        }
      },
    );
  }
}
