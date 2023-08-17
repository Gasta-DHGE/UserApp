import 'package:gasta_user_app/services/i_authentication_service.dart';

import '../utility/observable.dart';

class AuthenticationService implements IAuthenticationService {
  @override
  var isLoggedIn = Observable<bool>(false);

  @override
  Future<void> loginAsync() async {
    await Future.delayed(const Duration(seconds: 2));
    isLoggedIn.value = true;
  }

  @override
  Future<void> logoutAsync() async {
    await Future.delayed(const Duration(seconds: 2));
    isLoggedIn.value = false;
  }
}
