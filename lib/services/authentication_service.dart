import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'services.dart';

class AuthenticationService implements IAuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  User? user;

  AuthenticationService() {
    _firebaseAuth.authStateChanges().listen(
      (user) {
        if (user == null) {
          this.user = null;
          isLoggedIn.value = false;
        } else {
          this.user = user;
          isLoggedIn.value = true;
        }
      },
    );
  }

  @override
  ValueNotifier<bool> isLoggedIn = ValueNotifier<bool>(false);

  @override
  Future<AuthenticationResult> loginAsync(String email, String password) async {
    try {
      user = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      isLoggedIn.value = true;
      return AuthenticationResult.success;
    } on FirebaseAuthException catch (e) {
      isLoggedIn.value = false;

      if (e.code == "network-request-failed") {
        return AuthenticationResult.noConnection;
      }

      return AuthenticationResult.invalid;
    } catch (e) {
      return AuthenticationResult.unknown;
    }
  }

  @override
  Future<void> logoutAsync() async {
    await _firebaseAuth.signOut();
    isLoggedIn.value = false;
  }
}
