import 'package:apteka_uz/data/models/products/product_item.dart';
import 'package:apteka_uz/presentations/home_screen/widgets/drugs_widgets.dart';
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
    return ListView(
      children: List.generate(
        suggestions.length,
        (index) => DrugsWidgets(image: MyIcons.drug, name: suggestions[index].name, price: suggestions[index].price.toString(), quantity: suggestions[index].quantity.toString())
      ),
    );
  }
}
