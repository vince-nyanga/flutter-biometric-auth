import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import 'auth_state.dart';

class AuthController extends GetxController {
  final _localAuth = LocalAuthentication();
  final _authenticationStateStream = AuthenticationState().obs;
  final _biometricSupportedStream = false.obs;

  AuthenticationState get authState => _authenticationStateStream.value;
  bool get isBiometricsSupported => _biometricSupportedStream.value;

  @override
  void onInit() {
    _checkIfBiometricsSupported();
    _authenticationStateStream.value = UnAuthenticated();
    super.onInit();
  }

  Future<void> signInWithBiometrics() async {
    try {
      var isAuthenticated = await _localAuth.authenticate(
          localizedReason: 'Authenticate with your biometrics',
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true);
      if (isAuthenticated) {
        _authenticationStateStream.value = Authenticated();
      } else {
        _authenticationStateStream.value = UnAuthenticated();
      }
    } on PlatformException catch (e) {
      // display this error if you want
      print(e.message);
    }
  }

  void signOut() {
    _authenticationStateStream.value = UnAuthenticated();
  }

  void _checkIfBiometricsSupported() async {
    _biometricSupportedStream.value = await _localAuth.isDeviceSupported();
  }
}
