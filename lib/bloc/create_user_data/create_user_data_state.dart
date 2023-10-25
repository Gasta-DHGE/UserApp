part of 'create_user_data_bloc.dart';

@immutable
sealed class CreateUserDataState extends Equatable {
  const CreateUserDataState();

  @override
  List<Object> get props => [];
}

final class CreateUserDataDefault extends CreateUserDataState {
  final bool showAllErrors;
  final String generalErrorString;
  final String firstNameErrorString;
  final String lastNameErrorString;
  final String birthdateErrorString;
  final String genderErrorString;
  final String dietErrorString;
  final String cityErrorString;
  final String postcodeErrorString;
  final String streetErrorString;
  final String numberErrorString;
  final String additionalInformationErrorString;

  const CreateUserDataDefault({
    this.showAllErrors = true,
    this.generalErrorString = '',
    this.firstNameErrorString = '',
    this.lastNameErrorString = '',
    this.birthdateErrorString = '',
    this.genderErrorString = '',
    this.dietErrorString = '',
    this.cityErrorString = '',
    this.postcodeErrorString = '',
    this.streetErrorString = '',
    this.numberErrorString = '',
    this.additionalInformationErrorString = '',
  });

  @override
  List<Object> get props => [
        generalErrorString,
        firstNameErrorString,
        lastNameErrorString,
        birthdateErrorString,
        genderErrorString,
        dietErrorString,
        cityErrorString,
        postcodeErrorString,
        streetErrorString,
        numberErrorString,
        additionalInformationErrorString,
      ];
}

final class CreateUserDataLoading extends CreateUserDataState {}
