import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gasta_user_app/dependency_provider.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginDefault()) {
    on<Login>(_onLogin);
    on<Logout>(_onLogout);
  }

  void _onLogin(Login event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      await DependencyProvider.instance.authenticationService
          .loginAsync(event.username, event.password);
      emit(LoginDefault());
    } catch (e) {
      emit(LoginError(exceptionObject: e));
    }
  }

  void _onLogout(Logout event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    await DependencyProvider.instance.authenticationService.logoutAsync();
    emit(LoginDefault());
  }
}
