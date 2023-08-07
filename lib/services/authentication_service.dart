import 'package:gastas_user_app/services/i_authentication_service.dart';

import '../utility/observable.dart';

class AuthenticationService implements IAuthenticationService {
  @override
  var isLoggedIn = Observable<bool>(false);

  @override
  var isLoading = Observable<bool>(false);

  @override
  Future<void> logInAsync() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoggedIn.value = true;
    isLoading.value = false;
  }

  @override
  Future<void> logOutAsync() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoggedIn.value = false;
    isLoading.value = false;
  }
}
