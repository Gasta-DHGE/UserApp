import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'services.dart';

class AuthenticationService implements IAuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  User? user;

  @override
  ValueNotifier<bool> isLoggedIn = ValueNotifier<bool>(false);

  @override
  Future<void> loginAsync(String email, String password) async {
    try {
      user = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      isLoggedIn.value = true;
    } catch (e) {
      isLoggedIn.value = false;
    }
  }

  @override
  Future<void> logoutAsync() async {
    await _firebaseAuth.signOut();
    isLoggedIn.value = false;
  }
}
