part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

final class SignUp extends SignUpEvent {
  final String email;
  final String password;

  const SignUp({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

final class SignUpValuesUpdated extends SignUpEvent {
  final String email;
  final String password;
  final String repeatedPassword;

  const SignUpValuesUpdated(
      {required this.email,
      required this.password,
      required this.repeatedPassword});

  @override
  List<Object> get props => [email, password, repeatedPassword];
}
