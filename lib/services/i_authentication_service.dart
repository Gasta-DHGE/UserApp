import 'package:flutter/foundation.dart';

import '../models/models.dart';
import 'result.dart';

abstract class IAuthenticationService with ChangeNotifier {
  User? user;
  bool isLoggedIn = false;

  Future<Result> loginAsync(String email, String password);
  Future<void> logoutAsync();
  Future<Result> signupAsync(String email, String password);
}
