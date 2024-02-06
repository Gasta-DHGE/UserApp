import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:gasta_user_app/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:gasta_user_app/services/interfaces/i_authentication_service.dart';

class AuthenticationService
    with ChangeNotifier
    implements IAuthenticationService {
  final firebase.FirebaseAuth _firebaseAuth = firebase.FirebaseAuth.instance;

  User? _user;

  AuthenticationService() {
    _firebaseAuth.authStateChanges().listen(
      (user) async {
        if (user != null) {
          this.user = User(user);
        } else {
          this.user = null;
        }
      },
    );
  }

  @override
  User? get user => _user;
  @override
  set user(User? value) {
    _user = value;
    notifyListeners();
  }

  @override
  Future<void> signupAsync(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    notifyListeners();
  }

  @override
  Future<void> loginAsync(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    notifyListeners();
  }

  @override
  Future<void> logoutAsync() async {
    await _firebaseAuth.signOut();
    notifyListeners();
  }
}
