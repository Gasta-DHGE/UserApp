import 'package:gasta_user_app/utility/observable.dart';

import '../service_provider.dart';
import '../services/i_authentication_service.dart';

class LoginPageController {
  IAuthenticationService authenticationService =
      ServiceProvider.instance.authenticationService;

  var isLoading = Observable<bool>(false);

  Future<void> loginAsync() async {
    isLoading.value = true;
    await authenticationService.loginAsync();
    isLoading.value = false;
  }
}
