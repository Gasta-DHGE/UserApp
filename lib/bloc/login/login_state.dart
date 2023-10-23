part of 'login_bloc.dart';

@immutable
sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginDefault extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginError extends LoginState {
  final Object exceptionObject;

  const LoginError({required this.exceptionObject});

  String get errorString {
    if (exceptionObject is FirebaseAuthException) {
      if ((exceptionObject as FirebaseAuthException).code ==
          "network-request-failed") {
        return 'No Network Connection';
      }

      return 'Username or Password';
    }

    return 'Unknown Error';
  }

  @override
  List<Object> get props => [exceptionObject];
}
