import 'package:firebase_auth/firebase_auth.dart' as google;
import 'package:flutter/material.dart';

import '../models/models.dart';
import 'services.dart';

class AuthenticationService
    with ChangeNotifier
    implements IAuthenticationService {
  final google.FirebaseAuth _firebaseAuth = google.FirebaseAuth.instance;
  late IUserService _userService;
  User? _user;
  bool _isLoggedIn = false;

  @override
  User? get user => _user;

  @override
  set user(User? value) {
    _user = value;
    notifyListeners();
  }

  @override
  bool get isLoggedIn => _isLoggedIn;

  @override
  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  AuthenticationService({required IUserService userService}) {
    _userService = userService;
    _firebaseAuth.authStateChanges().listen(
      (user) async {
        if (user == null) {
          this.user = null;
          isLoggedIn = false;
        } else {
          try {
            this.user = User(
              firebaseUser: user,
              gastaUser: await _userService.getUserByIdAsync(user.uid),
            );
          } catch (e) {
            this.user = User(firebaseUser: user);
          }

          isLoggedIn = true;
        }
      },
    );
  }

  @override
  Future<SignupResult> signupAsync(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return SignupResult.success;
    } on google.FirebaseAuthException catch (e) {
      if (e.code == "network-request-failed") {
        return SignupResult.noConnection;
      }
      if (e.code == "email-already-in-use") {
        return SignupResult.alreadyInUse;
      }
      return SignupResult.invalid;
    } catch (e) {
      return SignupResult.unknown;
    }
  }

  @override
  Future<AuthenticationResult> loginAsync(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return AuthenticationResult.success;
    } on google.FirebaseAuthException catch (e) {
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
  }
}
