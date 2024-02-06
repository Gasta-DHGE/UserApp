import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:gasta_core/gasta_core.dart';

class User {
  late firebase.User _firebaseUserData;
  late UserEntity _gastaUserData;

  late bool? _hasGastaUserData;

  User(firebase.User firebaseUserData, {UserEntity? gastaUserData}) {
    _firebaseUserData = firebaseUserData;

    if (gastaUserData == null) {
      _gastaUserData = UserEntity.empty();
      _hasGastaUserData = null;
    } else if (gastaUserData == UserEntity.empty()) {
      _gastaUserData = UserEntity.empty();
      _hasGastaUserData = false;
    } else {
      _gastaUserData = gastaUserData;
      _hasGastaUserData = true;
    }
  }

  bool? get hasGastaUserData => _hasGastaUserData;

  String get userId => _firebaseUserData.uid;
  String get firstName => _gastaUserData.firstName;
  String get lastName => _gastaUserData.lastName;
  DateTime get birthDate => _gastaUserData.birthDate;
  Gender get gender => _gastaUserData.gender;
  Diet get diet => _gastaUserData.diet;
  AddressEntity get address => _gastaUserData.address;
}
