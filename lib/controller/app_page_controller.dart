import 'package:gastas_user_app/services/i_authentication_service.dart';

import '../service_provider.dart';

class AppPageController {
  IAuthenticationService authenticationService =
      ServiceProvider.instance.authenticationService;
}
