part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpDefault extends SignUpState {
  final bool showAllErrors;
  final String generalError;
  final String emailErrorString;
  final String passwordErrorString;
  final String repeatPasswordErrorString;

  const SignUpDefault(
      {this.showAllErrors = true,
      this.generalError = '',
      this.emailErrorString = '',
      this.passwordErrorString = '',
      this.repeatPasswordErrorString = ''});

  @override
  List<Object> get props => [
        generalError,
        emailErrorString,
        passwordErrorString,
        repeatPasswordErrorString,
      ];
}

final class SignUpLoading extends SignUpState {}
