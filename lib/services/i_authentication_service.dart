import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

abstract class IAuthenticationService {
  User? user;
  var isLoggedIn = ValueNotifier<bool>(false);

  Future<void> loginAsync(String email, String password);
  Future<void> logoutAsync();
}
