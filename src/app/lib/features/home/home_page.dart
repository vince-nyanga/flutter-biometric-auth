import 'package:app/features/features.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final _controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 200
            ),
            Text(
              'You are in 😄',
              style: Get.textTheme.headline3,
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: () {
                  _controller.signOut();
                },
                child: Text('Sign out'))
          ],
        ),
      ),
    );
  }
}
