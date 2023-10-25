import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/dependency_provider.dart';
import 'package:gasta_user_app/models/models.dart';
import 'package:meta/meta.dart';

part 'create_user_data_event.dart';
part 'create_user_data_state.dart';

class CreateUserDataBloc
    extends Bloc<CreateUserDataEvent, CreateUserDataState> {
  CreateUserDataBloc()
      : super(const CreateUserDataDefault(showAllErrors: false)) {
    on<CreateUserData>(_onCreateUserData);
    on<CreateUserDataValuesUpdated>(_onCreateUserDataValuesUpdated);
    on<CreateUserDataLogout>(_onCreateUserDataLogout);
  }

  void _onCreateUserData(
      CreateUserData event, Emitter<CreateUserDataState> emit) async {
    emit(CreateUserDataLoading());

    try {
      await DependencyProvider.instance.userService.createUser(
        DependencyProvider.instance.authenticationService.firebaseUser.uid,
        GastaUser(
          firstName: event.firstName,
          lastName: event.lastName,
          birthDate: event.birthdate,
          gender: event.gender,
          diet: event.diet,
          address: Address(
            city: event.city,
            street: event.street,
            streetNumber: int.parse(event.number),
            additionalInformation: event.additionalInformation,
            postcode: event.postcode,
            posLongitude: 1,
            posLatitude: 1,
          ),
        ),
      );

      DependencyProvider.instance.authenticationService.gastaUser =
          await DependencyProvider.instance.userService.getUserByIdAsync(
        DependencyProvider.instance.authenticationService.firebaseUser.uid,
      );

      emit(const CreateUserDataDefault());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        emit(const CreateUserDataDefault(
          showAllErrors: true,
          genderErrorString: 'No Network Connection.',
        ));
        return;
      }

      emit(CreateUserDataDefault(genderErrorString: e.toString()));
    } catch (e) {
      emit(CreateUserDataDefault(genderErrorString: e.toString()));
    }
  }

  void _onCreateUserDataValuesUpdated(
      CreateUserDataValuesUpdated event, Emitter<CreateUserDataState> emit) {
    emit(
      CreateUserDataDefault(
        showAllErrors: true,
        generalErrorString: '',
        firstNameErrorString:
            event.firstName.isEmpty ? 'First Name can not be empty.' : '',
        lastNameErrorString:
            event.lastName.isEmpty ? 'Last Name can not be empty.' : '',
        birthdateErrorString: '',
        genderErrorString: '',
        dietErrorString: '',
        cityErrorString: event.city.length < 2
            ? 'City must contain at least 2 characters.'
            : '',
        postcodeErrorString: event.postcode.length < 5
            ? 'Postcode must contain at least 5 numbers.'
            : '',
        streetErrorString: event.street.length < 2
            ? 'Street must contain at least 2 characters.'
            : '',
        numberErrorString:
            event.number.isEmpty ? 'Number can not be empty' : '',
        additionalInformationErrorString: '',
      ),
    );
  }

  void _onCreateUserDataLogout(
      CreateUserDataLogout event, Emitter<CreateUserDataState> emit) async {
    await DependencyProvider.instance.authenticationService.logoutAsync();
  }
}
