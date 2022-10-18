import 'package:apteka_uz/data/models/products/product_item.dart';
import 'package:apteka_uz/data/repositories/products_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.productsRepository}) : super(ProductsInitial());

  final ProductsRepository productsRepository;



  void getAllProduct() async {
    emit(ProductsInProgress());
    try {
      var data = await productsRepository.getProducts();
      emit(
          ProductsInSuccess(products: data)
      );
    } catch (error) {
      emit(
          ProductsInFailure(errorText: 'error text')
      );
    }
  }



}


