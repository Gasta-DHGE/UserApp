import 'package:flutter/material.dart';

import '../services/services.dart';

class SignupPageController with ChangeNotifier {
  IAuthenticationService authenticationService;
  String _username = '';
  String _password = '';
  String _repeatedPassword = '';

  String get username => _username;
  set username(String value) {
    _username = value;
    notifyListeners();
  }

  String get password => _password;
  set password(String value) {
    _password = value;
    notifyListeners();
  }

  String get repeatedPassword => _repeatedPassword;
  set repeatedPassword(String value) {
    _repeatedPassword = value;
    notifyListeners();
  }

  bool get isUsernameValid => username.isNotEmpty && username.contains('@');
  bool get isPasswordValid => password.length >= 6;
  bool get isRepeatedPasswordValid =>
      isPasswordValid && repeatedPassword == password;

  SignupPageController({required this.authenticationService});
}
