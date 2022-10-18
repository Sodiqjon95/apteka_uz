import 'package:apteka_uz/utils/style.dart';
import 'package:flutter/material.dart';

class UniversalTextInput extends StatelessWidget {
  const UniversalTextInput({
    Key? key,
    required this.onChanged,
    required this.hintText,
    required this.initialText,
    required this.keyBoardType,
    required this.errorText,
  }) : super(key: key);

  final String hintText;
  final String initialText;
  final String errorText;
  final TextInputType keyBoardType;

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    controller.text = initialText;
    final GlobalKey key = GlobalKey();

    return Form(
      key: key,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextFormField(
          cursorColor: Colors.blue,
          keyboardType: keyBoardType,
          controller: controller,
          onChanged: onChanged,
          validator: (value) {
            if (keyBoardType == TextInputType.text) {
              return (value!.length <= 3) ? errorText : null;
            } else if (keyBoardType == TextInputType.streetAddress) {
              return (value!.length > 13 || value.isEmpty) ? errorText : null;
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: MyTextStyle.sfProMedium.copyWith(),
            labelStyle: MyTextStyle.sfProMedium
                .copyWith(color: Theme.of(context).hintColor),
            enabled: true,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 1)),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 1)),
          ),
        ),
      ),
    );
  }
}
