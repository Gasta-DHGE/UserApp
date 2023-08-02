import 'package:gastas_user_app/observer.dart';

abstract class Observable<T> {
  void addObserver(Observer observer) {}
  void removeObserver(Observer observer) {}
  void notifyObservers(T value) {}
}
