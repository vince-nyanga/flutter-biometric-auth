import 'package:app/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 150,
            ),
            Text(
              'Welcome',
              style: Get.textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16,
            ),
            _getLoginButton()
          ],
        ),
      ),
    );
  }

  Widget _getLoginButton() {
    return Obx(() {
      if (controller.isBiometricsSupported) {
        return ElevatedButton(
          onPressed: () {
            controller.signInWithBiometrics();
          },
          child: Text('Login with biometrics'),
        );
      } else {
        return Text(
          'Oops, device does not support biometrics',
          style: Get.textTheme.bodyText1.copyWith(color: Get.theme.errorColor),
        );
      }
    });
  }
}
