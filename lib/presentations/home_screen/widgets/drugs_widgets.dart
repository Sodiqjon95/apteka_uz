import 'package:apteka_uz/utils/color.dart';
import 'package:apteka_uz/utils/style.dart';
import 'package:flutter/material.dart';

class DrugsWidgets extends StatelessWidget {
  const DrugsWidgets({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  final String image;
  final String name;
  final String price;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0, // soften the shadow//extend the shadow
              offset: Offset(
                5.0, // Move to right 10  horizontally
                5.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              width: 200,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  name,
                  style: MyTextStyle.sfBold800.copyWith(color: MyColors.textColor, fontSize: 20),
                ),
                Text(
                  "price : $price sum",
                  style: MyTextStyle.sfProSemibold.copyWith(color: Colors.red),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("quantity : $quantity"),
              ],
            )
          ],
        ));
  }
}
