part of 'create_user_data_bloc.dart';

@immutable
sealed class CreateUserDataEvent extends Equatable {
  const CreateUserDataEvent();

  @override
  List<Object> get props => [];
}

final class CreateUserData extends CreateUserDataEvent {
  final String firstName;
  final String lastName;
  final DateTime birthdate;
  final Gender gender;
  final Diet diet;
  final String city;
  final String postcode;
  final String street;
  final String number;
  final String additionalInformation;

  const CreateUserData({
    required this.firstName,
    required this.lastName,
    required this.birthdate,
    required this.gender,
    required this.diet,
    required this.city,
    required this.postcode,
    required this.street,
    required this.number,
    required this.additionalInformation,
  });

  @override
  List<Object> get props => [
        firstName,
        lastName,
        birthdate,
        gender,
        diet,
        city,
        postcode,
        street,
        number,
        additionalInformation,
      ];
}

final class CreateUserDataValuesUpdated extends CreateUserDataEvent {
  final String firstName;
  final String lastName;
  final DateTime birthdate;
  final Gender gender;
  final Diet diet;
  final String city;
  final String postcode;
  final String street;
  final String number;
  final String additionalInformation;

  const CreateUserDataValuesUpdated({
    required this.firstName,
    required this.lastName,
    required this.birthdate,
    required this.gender,
    required this.diet,
    required this.city,
    required this.postcode,
    required this.street,
    required this.number,
    required this.additionalInformation,
  });

  @override
  List<Object> get props => [
        firstName,
        lastName,
        birthdate,
        gender,
        diet,
        city,
        postcode,
        street,
        number,
        additionalInformation,
      ];
}

final class CreateUserDataLogout extends CreateUserDataEvent {}
