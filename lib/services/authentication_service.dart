import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gasta_user_app/models/models.dart';

import 'services.dart';

class AuthenticationService
    with ChangeNotifier
    implements IAuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late IUserService _userService;
  User? _firebaseUser;
  GastaUser? _gastaUser;

  @override
  User get firebaseUser => _firebaseUser!;
  @override
  GastaUser get gastaUser => _gastaUser!;

  @override
  set firebaseUser(User? value) {
    _firebaseUser = value;
    notifyListeners();
  }

  @override
  set gastaUser(GastaUser? value) {
    _gastaUser = value;
    notifyListeners();
  }

  @override
  bool get isLoggedIn {
    try {
      firebaseUser;
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  bool get hasGastaUserData {
    try {
      gastaUser;
      return true;
    } catch (e) {
      return false;
    }
  }

  AuthenticationService({required IUserService userService}) {
    _userService = userService;
    _firebaseAuth.authStateChanges().listen(
      (user) async {
        if (user == null) {
          firebaseUser = null;
          gastaUser = null;
        } else {
          _firebaseUser = user;
          try {
            gastaUser = await _userService.getUserByIdAsync(user.uid);
          } catch (e) {
            gastaUser = null;
          }
        }
      },
    );
  }

  @override
  Future<void> signupAsync(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> loginAsync(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> logoutAsync() async {
    await _firebaseAuth.signOut();
  }
}
