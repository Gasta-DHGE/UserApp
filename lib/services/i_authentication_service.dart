import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../models/models.dart';

abstract class IAuthenticationService with ChangeNotifier {
  late User firebaseUser;
  late GastaUser gastaUser;
  bool get isLoggedIn;
  bool get hasGastaUserData;

  Future<void> loginAsync(String email, String password);
  Future<void> logoutAsync();
  Future<void> signupAsync(String email, String password);
}
