import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

abstract class IAuthenticationService {
  User? user;
  var isLoggedIn = ValueNotifier<bool>(false);

  Future<AuthenticationResult> loginAsync(String email, String password);
  Future<void> logoutAsync();
}

enum AuthenticationResult { success, noConnection, invalid, unknown }
