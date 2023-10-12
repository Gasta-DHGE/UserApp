import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/services/services.dart';

import '../models/models.dart';

class CreateUserDataPageController with ChangeNotifier {
  IAuthenticationService authenticationService;
  IUserService userService;
  CreateUserDataPageController(
      {required this.authenticationService, required this.userService});

  String _firstName = '';
  String _lastName = '';
  DateTime birthDate = DateTime.now();
  Gender gender = Gender.male;
  Diet diet = Diet.everything;

  String _city = '';
  String _street = '';
  int streetnumber = 1;
  String additionalInformation = '';
  String _postcode = '';

  String get firstName => _firstName;
  set firstName(String value) {
    _firstName = value;
    notifyListeners();
  }

  String get lastName => _lastName;
  set lastName(String value) {
    _lastName = value;
    notifyListeners();
  }

  String get city => _city;
  set city(String value) {
    _city = value;
    notifyListeners();
  }

  String get street => _street;
  set street(String value) {
    _street = value;
    notifyListeners();
  }

  String get postcode => _postcode;
  set postcode(String value) {
    _postcode = value;
    notifyListeners();
  }

  bool get isFirstNameValid => firstName.isNotEmpty;
  bool get isLastNameValid => lastName.isNotEmpty;

  bool get isCityValid => city.length >= 2;
  bool get isStreetValid => street.length >= 2;
  bool get isPostcodeValid => postcode.length >= 5;

  bool get isDataValid =>
      isFirstNameValid &&
      isLastNameValid &&
      isCityValid &&
      isStreetValid &&
      isPostcodeValid;

  Future<void> createUserDataAsync() async {
    await userService.createUser(
      authenticationService.firebaseUser.uid,
      GastaUser(
        firstName: firstName,
        lastName: lastName,
        birthDate: birthDate,
        gender: gender,
        diet: diet,
        address: Address(
          city: city,
          street: street,
          streetNumber: streetnumber,
          additionalInformation: additionalInformation,
          postcode: postcode,
          posLatitude: 1,
          posLongitude: 1,
        ),
      ),
    );
    try {
      authenticationService.gastaUser = await userService
          .getUserByIdAsync(authenticationService.firebaseUser.uid);
    } catch (e) {
      await authenticationService.logoutAsync();
    }
  }
}
