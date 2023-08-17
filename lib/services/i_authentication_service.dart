import 'package:gasta_user_app/utility/observable.dart';

abstract class IAuthenticationService {
  var isLoggedIn = Observable<bool>(false);

  Future<void> loginAsync();
  Future<void> logoutAsync();
}
