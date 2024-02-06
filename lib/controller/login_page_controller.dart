import 'package:flutter/material.dart';
import 'package:gasta_user_app/services/interfaces/i_authentication_service.dart';

class LoginPageController with ChangeNotifier {
  IAuthenticationService authenticationService;

  bool _isLoading = false;
  String _username = '';
  String _password = '';
  String _error = '';

  LoginPageController(this.authenticationService);

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

  String get error => _error;
  set error(String value) {
    _error = value;
    notifyListeners();
  }

  Future<void> loginAsync() async {
    isLoading = true;
    error = '';

    try {
      await authenticationService.loginAsync(username, password);
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
  }
}
