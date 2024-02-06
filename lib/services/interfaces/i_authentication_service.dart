import 'package:flutter/material.dart';
import 'package:gasta_user_app/models/user.dart';

abstract class IAuthenticationService with ChangeNotifier {
  User? user;

  Future<void> loginAsync(String email, String password);
  Future<void> logoutAsync();
  Future<void> signupAsync(String email, String password);
}
