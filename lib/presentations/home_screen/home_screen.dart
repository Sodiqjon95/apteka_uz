import 'package:animate_do/animate_do.dart';
import 'package:apteka_uz/cubits/products/products_cubit.dart';
import 'package:apteka_uz/data/models/products/product_item.dart';
import 'package:apteka_uz/presentations/search_screen/search_screen.dart';
import 'package:apteka_uz/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/drugs_widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ProductItem> products = [];
  @override
  void initState() {
    BlocProvider.of<ProductsCubit>(context).getAllProduct();
    debugPrint("Home page ga kirdi");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.blue,
      backgroundColor: Colors.white,
      strokeWidth: 4.0,
      onRefresh: () async {
        BlocProvider.of<ProductsCubit>(context).getAllProduct();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Dorilar"),
          actions: [
            IconButton(
                onPressed: () => showSearch(
                      context: context,
                      delegate: ProductSearchView(
                        products: products,
                      ),
                    ),
                icon: const Icon(Icons.search))
          ],
          centerTitle: true,
        ),
        body: SafeArea(
          child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
            if (state is ProductsInProgress) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is ProductsInFailure) {
              return Center(
                child: Text(state.errorText.toString()),
              );
            } else if (state is ProductsInSuccess) {
              products = state.products;
              return ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return FadeInRightBig(
                    duration: const Duration(seconds: 1),
                    child: DrugsWidgets(
                      image: MyIcons.drug,
                      name: state.products[index].name,
                      price: state.products[index].price.toString(),
                      quantity: state.products[index].quantity.toString(),
                    ),
                  );
                },
              );
            }
            return const SizedBox();
          }),
        ),
      ),
    );
  }
}
