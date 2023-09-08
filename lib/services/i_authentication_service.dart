import 'package:flutter/foundation.dart';

abstract class IAuthenticationService {
  var isLoggedIn = ValueNotifier<bool>(false);

  Future<void> loginAsync();
  Future<void> logoutAsync();
}
