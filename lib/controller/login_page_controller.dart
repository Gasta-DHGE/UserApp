import 'package:flutter/material.dart';

import '../services/i_authentication_service.dart';

class LoginPageController {
  IAuthenticationService authenticationService;
  String username = '';
  String password = '';

  AuthenticationResult lastAuthenticationResult = AuthenticationResult.success;
  String get errorString {
    switch (lastAuthenticationResult) {
      case AuthenticationResult.success:
        return '';
      case AuthenticationResult.invalid:
        return 'Invalid Username or Password';
      case AuthenticationResult.noConnection:
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
