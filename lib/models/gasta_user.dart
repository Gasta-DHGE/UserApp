import 'package:gasta_core/gasta_core.dart';

import 'models.dart';

class GastaUser {
  String firstName;
  String lastName;
  DateTime birthDate;
  Gender gender;
  Diet diet;
  Address address;

  GastaUser(
      {required this.firstName,
      required this.lastName,
      required this.birthDate,
      required this.gender,
      required this.diet,
      required this.address});

  static GastaUser fromJson(Map<String, dynamic> json) {
    return GastaUser(
      firstName: json['firstName'],
      lastName: json['lastName'],
      birthDate: Util.getDateTimeBySecondsTimeStamp(
        json['birthDate'] as int,
      ),
      gender: Gender.values
          .where((element) => element.toString() == json['gener'])
          .first,
      diet: Diet.values
          .where((element) => element.toString() == json['diet'])
          .first,
      address: Address.fromJson(json['address']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'birthDate': Util.getSecondsTimeStampByDateTime(birthDate),
      'gender': gender.toString(),
      'diet': diet.toString(),
      'address': address.toJson(),
    };
  }
}
