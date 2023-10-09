import 'package:flutter/foundation.dart';

import '../models/models.dart';

abstract class IAuthenticationService with ChangeNotifier {
  User? user;
  bool isLoggedIn = false;

  Future<AuthenticationResult> loginAsync(String email, String password);
  Future<void> logoutAsync();
  Future<SignupResult> signupAsync(String email, String password);
}

enum AuthenticationResult { success, noConnection, invalid, unknown }

enum SignupResult { success, noConnection, alreadyInUse, invalid, unknown }
