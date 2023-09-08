import 'package:flutter/material.dart';

import '../dependency_provider.dart';
import '../services/i_authentication_service.dart';

class SettingsPageController {
  IAuthenticationService authenticationService;

  SettingsPageController({required this.authenticationService});

  var isLoading = ValueNotifier<bool>(false);

  Future<void> logoutAsync() async {
    isLoading.value = true;
    await authenticationService.logoutAsync();
    isLoading.value = false;
  }
}
