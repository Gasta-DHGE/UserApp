import 'package:equatable/equatable.dart';
import 'package:gasta_core/gasta_core.dart';

import 'models.dart';

class GastaUser extends Equatable {
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final Gender gender;
  final Diet diet;
  final Address address;

  const GastaUser(
      {required this.firstName,
      required this.lastName,
      required this.birthDate,
      required this.gender,
      required this.diet,
      required this.address});

  GastaUser copyWith({
    String? firstName,
    String? lastName,
    DateTime? birthDate,
    Gender? gender,
    Diet? diet,
    Address? address,
  }) {
    return GastaUser(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      diet: diet ?? this.diet,
      address: address ?? this.address,
    );
  }

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

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        birthDate,
        gender,
        diet,
        address,
      ];
}
