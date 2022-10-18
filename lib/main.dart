import 'package:apteka_uz/cubits/auth/auth_cubit.dart';
import 'package:apteka_uz/data/local/storage/storage.dart';
import 'package:apteka_uz/data/repositories/products_repository.dart';
import 'package:apteka_uz/data/services/api_client.dart';
import 'package:apteka_uz/data/services/api_provider.dart';
import 'package:apteka_uz/presentations/routes/routers.dart';
import 'package:apteka_uz/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ProductsRepository(
            apiService: ApiProvider(
              apiClient: ApiClient(),
              storageRepository: StorageRepository(),
            ),
          ),
        ),
      ],
      child: BlocProvider(
        create: (context) => AuthCubit(
          productsRepository: context.read<ProductsRepository>(),
        ),
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: MyRouter.generateRoute,
      initialRoute: splashPage,
    );
  }
}
