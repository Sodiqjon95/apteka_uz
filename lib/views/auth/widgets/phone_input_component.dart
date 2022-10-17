import 'package:apteka_uz/utils/color.dart';
import 'package:apteka_uz/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


class PhoneInputComponent extends StatefulWidget {
  const PhoneInputComponent(
      {Key? key,
      required this.phoneText,
      required this.initialValue,
      required this.caption})
      : super(key: key);

  final ValueChanged<String> phoneText;
  final String initialValue;
  final String caption;

  @override
  State<PhoneInputComponent> createState() => _PhoneInputComponentState();
}

class _PhoneInputComponentState extends State<PhoneInputComponent> {
  late MaskTextInputFormatter phoneMaskFormatter;
  final FocusNode phoneFocusNode = FocusNode();
  final TextEditingController controller = TextEditingController();
  String shadowText = "XX XXX-XX-XX";

  String updateShadowText(String currentText) {
    shadowText = "XX XXX-XX-XX";
    shadowText = shadowText.substring(currentText.length, shadowText.length);
    return currentText + shadowText;
  }

  @override
  void initState() {
    phoneMaskFormatter = MaskTextInputFormatter(
      mask: '## ###-##-##',
      filter: {
        "#": RegExp(r'[0-9]'),
      },
    );
    controller.text = phoneMaskFormatter.maskText(widget.initialValue);
    updateShadowText(widget.initialValue);
    super.initState();
  }

  @override
  void dispose() {
    phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: Colors.blue)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(height: 2),
              Text(
                "+998 ",
                style: MyTextStyle.sfProSemibold
                    .copyWith(color: MyColors.textColor, fontSize: 16),
              ),
            ],
          ),
          Expanded(
            child: TextField(
              controller: controller,
              inputFormatters: [phoneMaskFormatter],
              keyboardType: const TextInputType.numberWithOptions(
                signed: false,
                decimal: true,
              ),
              cursorColor: MyColors.textColor,
              cursorHeight: 22,
              focusNode: phoneFocusNode,
              onChanged: (String value) {
                setState(() {
                  if (value.length == 12) {
                    phoneFocusNode.unfocus();
                  }
                  widget.phoneText.call(value);
                  shadowText = updateShadowText(value);
                });
              },
              style: MyTextStyle.sfProSemibold
                  .copyWith(fontSize: 16, color: MyColors.textColor),
              decoration: InputDecoration(
                hintStyle: MyTextStyle.sfProSemibold
                    .copyWith(color: MyColors.textColor, fontSize: 16),
                hintText: "XX XXX-XX-XX",
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                disabledBorder: InputBorder.none,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
