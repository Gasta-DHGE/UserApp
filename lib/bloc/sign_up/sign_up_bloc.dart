import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gasta_user_app/dependency_provider.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpDefault(showAllErrors: false)) {
    on<SignUp>(_onSignUp);
    on<SignUpValuesUpdated>(_onSignUpValuesUpdated);
  }

  void _onSignUp(SignUp event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());

    try {
      await DependencyProvider.instance.authenticationService
          .signupAsync(event.email, event.password);
      emit(const SignUpDefault());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(const SignUpDefault(emailErrorString: 'E-Mail already in use.'));
        return;
      }

      if (e.code == 'network-request-failed') {
        emit(const SignUpDefault(generalError: 'No Network Connection'));
        return;
      }

      emit(SignUpDefault(generalError: e.toString()));
    } catch (e) {
      emit(SignUpDefault(generalError: e.toString()));
    }
  }

  void _onSignUpValuesUpdated(
      SignUpValuesUpdated event, Emitter<SignUpState> emit) {
    emit(
      SignUpDefault(
        emailErrorString:
            !event.email.contains('@') ? 'E-Mail must contain \'@\'.' : '',
        passwordErrorString: !(event.password.length >= 6)
            ? 'Password must contain at least 6 characters.'
            : '',
        repeatPasswordErrorString: event.password != event.repeatedPassword
            ? 'Not the same Password.'
            : '',
      ),
    );
  }
}
