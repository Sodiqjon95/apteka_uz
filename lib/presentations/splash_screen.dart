import 'package:apteka_uz/data/local/storage/storage.dart';
import 'package:apteka_uz/utils/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/images-removebg-preview.png"),
      ),
    );
  }

  Future<void> _init() async {
    String routeName = '';
    if (StorageRepository().storage.read("isRegistered") != true ||
        StorageRepository().storage.read("token") == null) {
      routeName = authPage;
    } else if (StorageRepository().storage.read("isRegistered") == true ||
        StorageRepository().storage.read("token") != null) {
      routeName = homePage;
    }
    await Future.delayed(const Duration(seconds: 4));
    Navigator.pushReplacementNamed(context, routeName);
  }
}
