import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

abstract class IAuthenticationService {
  User? user;
  var isLoggedIn = ValueNotifier<bool>(false);

  Future<AuthenticationResult> loginAsync(String email, String password);
  Future<void> logoutAsync();
  Future<void> signupAsync(String email, String password);
}

enum AuthenticationResult { success, noConnection, invalid, unknown }
