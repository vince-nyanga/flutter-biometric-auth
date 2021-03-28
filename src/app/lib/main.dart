import 'package:app/features/features.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  initialize();
  runApp(MyApp());
}

void initialize() {
  Get.lazyPut(() => AuthController());
}

class MyApp extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Biometric Auth',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      home: Obx(() {
        if (controller.authState is UnAuthenticated) {
          return AuthPage();
        }else {
          return HomePage();
        }
      }),
    );
  }
}
