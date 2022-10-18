import 'package:apteka_uz/cubits/auth/auth_cubit.dart';
import 'package:apteka_uz/presentations/auth/widgets/universal_text_input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  @override
  void initState() {
    print("login pagega kirdi");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height * 0.93,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 210,
              width: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email"),
                  UniversalTextInput(
                    onChanged: (String value) {
                      email = value;
                    },
                    hintText: 'Email',
                    keyBoardType: TextInputType.emailAddress,
                    errorText: 'Email kiriting',
                  ),
                  Text("Password"),

                  UniversalTextInput(
                    onChanged: (String value) {
                      password = value;
                    },
                    hintText: 'Password',
                    keyBoardType: TextInputType.text,
                    errorText: 'A-Z, a-z, !-#, 0-9',
                  ),
                ],
              ),
            ),
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(10),
                minimumSize: MaterialStateProperty.all(
                  const Size(250, 50),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: const BorderSide(color: Colors.white, width: 2),
                )),
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () async {
                debugPrint("Conteeeeex >>>> ${context.toString()}");
                context
                    .read<AuthCubit>()
                    .signIn(context: context, email: email, password: password);
              },
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.blue, fontSize: 18),
                text: "New Here? ",
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.read<AuthCubit>().changeState(SingUpState());
                      },
                    text: "Register",
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
