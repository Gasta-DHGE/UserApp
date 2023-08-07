import 'observer.dart';

class Observable<T> {
  Observable(this._value);
  T _value;
  List<Observer> observers = [];

  T get value => _value;
  set value(T value) {
    _value = value;
    notify();
  }

  void notify() {
    for (var observer in observers) {
      observer.onNotify(value);
    }
  }

  void addObserver(Observer observer) {
    observers.add(observer);
  }

  void removeObserver(Observer observer) {
    observers.remove(observer);
  }
}
