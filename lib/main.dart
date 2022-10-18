import 'package:apteka_uz/cubits/auth/auth_cubit.dart';
import 'package:apteka_uz/data/repositories/drugs_repository.dart';
import 'package:apteka_uz/data/services/api_client.dart';
import 'package:apteka_uz/data/services/api_provider.dart';
import 'package:apteka_uz/presentations/routes/routers.dart';
import 'package:apteka_uz/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ProductsRepository(
        apiService: ApiProvider(
          apiClient: ApiClient(),
        ),
      ),
      child: BlocProvider(
        create: (context) => AuthCubit(),
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
