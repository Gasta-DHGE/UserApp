import 'package:gastas_user_app/utility/observable.dart';

abstract class IAuthenticationService {
  var isLoggedIn = Observable<bool>(false);
  var isLoading = Observable<bool>(false);

  Future<void> logInAsync();
  Future<void> logOutAsync();
}
