import 'package:flutter/material.dart';

import '../services/i_authentication_service.dart';
import '../services/result.dart';

class LoginPageController {
  IAuthenticationService authenticationService;
  String username = '';
  String password = '';

  Result lastAuthenticationResult = Result.success;
  String get errorString {
    switch (lastAuthenticationResult) {
      case Result.success:
        return '';
      case Result.invalid:
        return 'Invalid Username or Password';
      case Result.noConnection:
        return 'No Connection, please check your connection or try again later';
      default:
        return 'Please try again';
    }
  }

  LoginPageController({required this.authenticationService});

  var isLoading = ValueNotifier<bool>(false);

  Future<void> loginAsync() async {
    isLoading.value = true;
    lastAuthenticationResult =
        await authenticationService.loginAsync(username, password);
    isLoading.value = false;
  }
}
