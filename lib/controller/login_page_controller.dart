import 'package:flutter/material.dart';
import 'package:gasta_user_app/page/pages.dart';

import '../dependency_provider.dart';
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
