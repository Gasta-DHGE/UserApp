import 'package:firebase_auth/firebase_auth.dart' as google;
import 'models.dart';

class User {
  google.User firebaseUser;
  GastaUser? gastaUser;

  User({required this.firebaseUser, this.gastaUser});
}
