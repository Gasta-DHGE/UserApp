import 'package:flutter/material.dart';

import '../services/services.dart';

class SignupPageController with ChangeNotifier {
  IAuthenticationService authenticationService;
  bool _isLoading = false;
  String _username = '';
  String _password = '';
  String _repeatedPassword = '';

  Result lastSignupResult = Result.success;
  String get errorString {
    switch (lastSignupResult) {
      case Result.success:
        return '';
      case Result.invalid:
        return 'Invalid Username or Password';
      case Result.noConnection:
        return 'No Connection, please check your connection or try again later';
      default:
        return 'Please try again';
    }
  }

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

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
