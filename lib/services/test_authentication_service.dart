import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gasta_user_app/services/i_authentication_service.dart';

class TestAuthenticationService implements IAuthenticationService {
  @override
  var isLoggedIn = ValueNotifier<bool>(false);

  @override
  Future<AuthenticationResult> loginAsync(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    isLoggedIn.value = true;
    return AuthenticationResult.success;
  }

  @override
  Future<void> logoutAsync() async {
    await Future.delayed(const Duration(seconds: 2));
    isLoggedIn.value = false;
  }

  @override
  User? user;

  @override
  Future<void> signupAsync(String email, String password) {
    // TODO: implement signupAsync
    throw UnimplementedError();
  }
}
