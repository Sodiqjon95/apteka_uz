import 'package:apteka_uz/data/models/products/drugs_item.dart';
import 'package:apteka_uz/data/services/api_provider.dart';

class ProductsRepository {
  ProductsRepository({required this.apiService});

  ApiProvider apiService;

  // Future<List<DrugsItem>> getProducts() => apiService.getData();

  // Future<bool> addProduct(
  //         {required String productName, required String productId}) =>
  //     apiService.addData(name: productName, id: productId);

  // Future<bool> deleteProduct({required String id}) =>
  //     apiService.deleteData(id: id);
  // Future signUp(
  //         {required String userName,
  //         required String email,
  //         required String password}) =>
  //     apiService.signUp(userName: userName, email: email, password: password);
      
  // Future signIn({required String email, required String password}) =>
  //     apiService.signIn(email: email, password: password);
}