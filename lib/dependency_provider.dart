import 'package:gasta_user_app/services/authentication_service.dart';
import 'package:gasta_user_app/services/interfaces/i_authentication_service.dart';

class DependencyProvider {
  DependencyProvider._() {
    _authenticationService = AuthenticationService();
  }

  static DependencyProvider? _instance;
  static DependencyProvider get instance {
    if (_instance == null) {
      _instance = DependencyProvider._();
      return _instance!;
    } else {
      return _instance!;
    }
  }

  late IAuthenticationService _authenticationService;
  IAuthenticationService get authenticationService => _authenticationService;
}
