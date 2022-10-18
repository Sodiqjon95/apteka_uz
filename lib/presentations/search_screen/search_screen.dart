import 'package:apteka_uz/data/models/products/product_item.dart';
import 'package:apteka_uz/utils/color.dart';
import 'package:apteka_uz/utils/icons.dart';
import 'package:apteka_uz/utils/style.dart';
import 'package:flutter/material.dart';

class ProductSearchView extends SearchDelegate {
  ProductSearchView({
    required this.products,
  });

  final List<ProductItem> products;

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
        onPressed: () {
          close(context, query);
        },
      );

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(
          fontSize: 64,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ProductItem> suggestions = products.where((searchResult) {
      final result = searchResult.name.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: List.generate(
          suggestions.length,
          (index) => Container(
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
                  MyIcons.drug,
                  width: 200,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      suggestions[index].name,
                      style: MyTextStyle.sfBold800
                          .copyWith(color: MyColors.textColor, fontSize: 20),
                    ),
                    Text(
                      "price : ${suggestions[index].price.toString()} sum",
                      style:
                          MyTextStyle.sfProSemibold.copyWith(color: Colors.red),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                        "quantity : ${suggestions[index].quantity.toString()}"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
