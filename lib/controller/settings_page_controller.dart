import '../service_provider.dart';
import '../services/i_authentication_service.dart';
import '../utility/observable.dart';

class SettingsPageController {
  IAuthenticationService authenticationService =
      ServiceProvider.instance.authenticationService;

  var isLoading = Observable<bool>(false);

  Future<void> logoutAsync() async {
    isLoading.value = true;
    await authenticationService.logoutAsync();
    isLoading.value = false;
  }
}
