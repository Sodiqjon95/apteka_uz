import 'package:apteka_uz/cubits/auth/auth_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:apteka_uz/presentations/auth/widgets/phone_input_component.dart';
import 'package:apteka_uz/presentations/auth/widgets/universal_text_input.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.blue,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.98,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            const SizedBox(
              child: Text(
                "Register",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                ),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),

            /// input information: email, password, confirm password
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UniversalTextInput(
                    onChanged: (String value) {
                      firstName = value;
                    },
                    hintText: 'FirstName ',
                    initialText: '',
                    keyBoardType: TextInputType.text,
                    errorText: 'Ism kiriting',
                  ),
                  UniversalTextInput(
                    onChanged: (String value) {
                      lastName = value;
                    },
                    hintText: 'LastName ',
                    initialText: '',
                    keyBoardType: TextInputType.text,
                    errorText: 'Familya kiriting',
                  ),
                  UniversalTextInput(
                    onChanged: (String value) {
                      email = value;
                    },
                    hintText: 'Email',
                    initialText: '',
                    keyBoardType: TextInputType.emailAddress,
                    errorText: 'Email kiriting',
                  ),
                  UniversalTextInput(
                    onChanged: (String value) {
                      password = value;
                    },
                    hintText: 'Password',
                    initialText: '',
                    keyBoardType: TextInputType.text,
                    errorText: 'A-Z, a-z, !-#, 0-9',
                  ),
                  PhoneInputComponent(
                    phoneText: (String value) {
                      phoneNumber = value;
                    },
                    initialValue: '',
                    caption: 'phone number',
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 55,
            ),

            /// submit
            SizedBox(
              child: TextButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(10),
                  minimumSize: MaterialStateProperty.all(
                    const Size(250, 50),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.blue,
                  ),
                ),
                onPressed: () {
                  context.read<AuthCubit>().signUp(
                      context: context,
                      firstName: firstName,
                      lastName: lastName,
                      email: email,
                      password: password,
                      phoneNumber: phoneNumber);
                },
                child: const Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),

            /// already member? login
            Center(
              child: SizedBox(
                width: 200,
                height: 40,
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.blue, fontSize: 18),
                    text: "Already Member? ",
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context
                              .read<AuthCubit>()
                              .changeState(SignInState()),
                        text: "Login",
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
