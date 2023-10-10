import 'package:flutter/material.dart';
import 'package:gasta_user_app/services/i_authentication_service.dart';

import '../models/models.dart';
import 'result.dart';

class TestAuthenticationService
    with ChangeNotifier
    implements IAuthenticationService {
  @override
  bool isLoggedIn = false;

  @override
  Future<Result> loginAsync(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    isLoggedIn = true;
    return Result.success;
  }

  @override
  Future<void> logoutAsync() async {
    await Future.delayed(const Duration(seconds: 2));
    isLoggedIn = false;
  }

  @override
  Future<Result> signupAsync(String email, String password) {
    // TODO: implement signupAsync
    throw UnimplementedError();
  }

  @override
  User? user;
}
