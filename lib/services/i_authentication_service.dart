import 'package:gastas_user_app/observer.dart';

import '../observable.dart';

abstract class IAuthenticationService implements Observable<bool> {
  final List<Observer> _isLoggedInObservers = [];
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyObservers(value);
  }

  @override
  void addObserver(Observer observer) {
    _isLoggedInObservers.add(observer);
  }

  @override
  void removeObserver(Observer observer) {
    _isLoggedInObservers.remove(observer);
  }

  @override
  void notifyObservers(bool value) {
    for (var observer in _isLoggedInObservers) {
      observer.notifyChange(value);
    }
  }
}
