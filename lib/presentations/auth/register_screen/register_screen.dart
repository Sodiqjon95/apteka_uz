import 'package:apteka_uz/presentations/auth/widgets/phone_input_component.dart';
import 'package:apteka_uz/presentations/auth/widgets/universal_text_input.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("register"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          UniversalTextInput(
            onChanged: (String value) {},
            hintText: 'FirstName ',
            initialText: '',
            keyBoardType: TextInputType.text,
            errorText: 'Ism kiriting',
          ),
          const SizedBox(
            height: 15,
          ),
          UniversalTextInput(
            onChanged: (String value) {},
            hintText: 'LastName ',
            initialText: '',
            keyBoardType: TextInputType.text,
            errorText: 'Familya kiriting',
          ),
          const SizedBox(
            height: 15,
          ),
          UniversalTextInput(
            onChanged: (String value) {},
            hintText: 'Email',
            initialText: '',
            keyBoardType: TextInputType.emailAddress,
            errorText: 'Email kiriting',
          ),
          const SizedBox(
            height: 15,
          ),
          UniversalTextInput(
            onChanged: (String value) {},
            hintText: 'Password',
            initialText: '',
            keyBoardType: TextInputType.text,
            errorText: 'A-Z, a-z, !-#, 0-9',
          ),
          const SizedBox(
            height: 15,
          ),
          PhoneInputComponent(
            phoneText: (String value) {},
            initialValue: '',
            caption: 'phone number',
          )
        ],
      ),
    );
  }
}
