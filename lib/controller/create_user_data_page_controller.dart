import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/services/services.dart';

import '../models/models.dart';

class CreateUserDataPageController {
  IAuthenticationService authenticationService;
  IUserService userService;
  CreateUserDataPageController(
      {required this.authenticationService, required this.userService});

  String firstName = '';
  String lastName = '';
  DateTime birthDate = DateTime.now();
  Gender gender = Gender.male;
  Diet diet = Diet.everything;

  String city = '';
  String street = '';
  int streetnumber = 1;
  String additionalInformation = '';
  String postcode = '';
  double posLongitude = 1;
  double posLatitude = 1;

  Future<void> createUserDataAsync() async {
    await userService.createUser(
      User(
        firebaseUser: authenticationService.user!.firebaseUser,
        gastaUser: GastaUser(
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
              posLatitude: posLatitude,
              posLongitude: posLongitude),
        ),
      ),
    );
    authenticationService.user = User(
        firebaseUser: authenticationService.user!.firebaseUser,
        gastaUser: await userService
            .getUserByIdAsync(authenticationService.user!.firebaseUser.uid));
  }
}
