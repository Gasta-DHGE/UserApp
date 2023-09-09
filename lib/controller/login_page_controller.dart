import 'package:flutter/material.dart';

import '../services/i_authentication_service.dart';

class LoginPageController {
  IAuthenticationService authenticationService;

  LoginPageController({required this.authenticationService});

  var isLoading = ValueNotifier<bool>(false);

  Future<void> loginAsync() async {
    isLoading.value = true;
    await authenticationService.loginAsync();
    isLoading.value = false;
  }
}
