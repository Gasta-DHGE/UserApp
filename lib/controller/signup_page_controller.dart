import '../services/services.dart';

class SignupPageController {
  IAuthenticationService authenticationService;
  String username = '';
  String password = '';
  String repeatedPassword = '';

  SignupPageController({required this.authenticationService});
}
