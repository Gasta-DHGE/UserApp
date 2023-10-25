import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/bloc/create_user_data/create_user_data_bloc.dart';

class CreateUserDataPage extends StatefulWidget {
  const CreateUserDataPage({super.key});

  @override
  State<StatefulWidget> createState() => _CreateUserDataPage();
}

class _CreateUserDataPage extends State<CreateUserDataPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  DateTime birthdate = DateTime.now();
  core.Gender gender = core.Gender.male;
  core.Diet diet = core.Diet.everything;
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postcodeController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController streetnumberController = TextEditingController();
  final TextEditingController additionalInformationController =
      TextEditingController();

  CreateUserDataValuesUpdated getValues({
    String? firstName,
    String? lastName,
    DateTime? birthdate,
    Gender? gender,
    Diet? diet,
    String? city,
    String? postcode,
    String? street,
    String? streetNumber,
    String? additionalInformation,
  }) {
    return CreateUserDataValuesUpdated(
      firstName: firstName ?? firstNameController.text,
      lastName: lastNameController.text,
      birthdate: birthdate ?? this.birthdate,
      gender: gender ?? this.gender,
      diet: diet ?? this.diet,
      city: city ?? cityController.text,
      postcode: postcode ?? postcodeController.text,
      street: street ?? streetController.text,
      number: streetNumber ?? streetnumberController.text,
      additionalInformation:
          additionalInformation ?? additionalInformationController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Complete Registration",
                style: core.Styles.headlineTextStyle(context),
              ),
              BlocBuilder<CreateUserDataBloc, CreateUserDataState>(
                builder: (context, state) {
                  if (state is CreateUserDataLoading) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (state is CreateUserDataDefault) {
                    return Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: TextField(
                                    controller: firstNameController,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp("[a-zA-Z]"),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      context.read<CreateUserDataBloc>().add(
                                            getValues(firstName: value),
                                          );
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'First Name',
                                      errorText: state.firstNameErrorString
                                                  .isNotEmpty &&
                                              (state.showAllErrors ||
                                                  firstNameController
                                                      .text.isNotEmpty)
                                          ? state.firstNameErrorString
                                          : null,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: TextField(
                                    controller: lastNameController,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp("[a-zA-Z]"),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      context.read<CreateUserDataBloc>().add(
                                            getValues(lastName: value),
                                          );
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Last Name',
                                      errorText: state.lastNameErrorString
                                                  .isNotEmpty &&
                                              (state.showAllErrors ||
                                                  lastNameController
                                                      .text.isNotEmpty)
                                          ? state.lastNameErrorString
                                          : null,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: TextField(
                                    readOnly: true,
                                    controller: TextEditingController(
                                        text:
                                            "${birthdate.day}.${birthdate.month}.${birthdate.year}"),
                                    onTap: () async {
                                      birthdate = (await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime.now(),
                                          )) ??
                                          DateTime.now();

                                      // ignore: use_build_context_synchronously
                                      context.read<CreateUserDataBloc>().add(
                                            getValues(birthdate: birthdate),
                                          );
                                    },
                                    decoration: const InputDecoration(
                                        labelText: 'Birthdate'),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, right: 8.0, bottom: 8.0),
                                        child: core.DefaultDropdownButton<
                                            core.Gender>(
                                          labelText: 'Gender',
                                          value: core.Gender.male,
                                          items: const [
                                            DropdownMenuItem<core.Gender>(
                                              value: core.Gender.male,
                                              child: Text('Male'),
                                            ),
                                            DropdownMenuItem<core.Gender>(
                                              value: core.Gender.female,
                                              child: Text('Female'),
                                            ),
                                            DropdownMenuItem<core.Gender>(
                                              value: core.Gender.other,
                                              child: Text('Other'),
                                            ),
                                          ],
                                          onChanged: (value) {
                                            context
                                                .read<CreateUserDataBloc>()
                                                .add(
                                                  getValues(gender: value),
                                                );
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, left: 8.0, bottom: 8.0),
                                        child: core.DefaultDropdownButton<
                                            core.Diet>(
                                          labelText: 'Diet',
                                          value: core.Diet.everything,
                                          items: const [
                                            DropdownMenuItem<core.Diet>(
                                              value: core.Diet.everything,
                                              child: Text('Everything'),
                                            ),
                                            DropdownMenuItem<core.Diet>(
                                              value: core.Diet.vegetarian,
                                              child: Text('Vegetarian'),
                                            ),
                                            DropdownMenuItem<core.Diet>(
                                              value: core.Diet.vegan,
                                              child: Text('Vegan'),
                                            ),
                                          ],
                                          onChanged: (value) {
                                            context
                                                .read<CreateUserDataBloc>()
                                                .add(
                                                  getValues(diet: diet),
                                                );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, right: 8.0, bottom: 8.0),
                                        child: TextField(
                                          controller: cityController,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                              RegExp("[a-zA-Z]"),
                                            ),
                                          ],
                                          onChanged: (value) {
                                            context
                                                .read<CreateUserDataBloc>()
                                                .add(
                                                  getValues(city: value),
                                                );
                                          },
                                          decoration: InputDecoration(
                                            labelText: 'City',
                                            errorText: state.cityErrorString
                                                        .isNotEmpty &&
                                                    (state.showAllErrors ||
                                                        cityController
                                                            .text.isNotEmpty)
                                                ? state.cityErrorString
                                                : null,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, left: 8.0, bottom: 8.0),
                                        child: TextField(
                                          controller: postcodeController,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          onChanged: (value) {
                                            context
                                                .read<CreateUserDataBloc>()
                                                .add(
                                                  getValues(postcode: value),
                                                );
                                          },
                                          decoration: InputDecoration(
                                            labelText: 'Postcode',
                                            errorText: state.postcodeErrorString
                                                        .isNotEmpty &&
                                                    (state.showAllErrors ||
                                                        postcodeController
                                                            .text.isNotEmpty)
                                                ? state.postcodeErrorString
                                                : null,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, right: 8.0, bottom: 8.0),
                                        child: TextField(
                                          controller: streetController,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                              RegExp("[a-zA-Z]"),
                                            ),
                                          ],
                                          onChanged: (value) {
                                            context
                                                .read<CreateUserDataBloc>()
                                                .add(
                                                  getValues(street: value),
                                                );
                                          },
                                          decoration: InputDecoration(
                                            labelText: 'Street',
                                            errorText: state.streetErrorString
                                                        .isNotEmpty &&
                                                    (state.showAllErrors ||
                                                        streetController
                                                            .text.isNotEmpty)
                                                ? state.streetErrorString
                                                : null,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, left: 8.0, bottom: 8.0),
                                        child: TextField(
                                          controller: streetnumberController,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          onChanged: (value) {
                                            context
                                                .read<CreateUserDataBloc>()
                                                .add(
                                                  getValues(
                                                    streetNumber: value,
                                                  ),
                                                );
                                          },
                                          decoration: InputDecoration(
                                            labelText: 'Number',
                                            errorText: state.numberErrorString
                                                        .isNotEmpty &&
                                                    (state.showAllErrors ||
                                                        streetnumberController
                                                            .text.isNotEmpty)
                                                ? state.numberErrorString
                                                : null,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: TextField(
                                    controller: additionalInformationController,
                                    onChanged: (value) {
                                      context.read<CreateUserDataBloc>().add(
                                            getValues(
                                                additionalInformation: value),
                                          );
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Additional Information',
                                      errorText: state
                                                  .additionalInformationErrorString
                                                  .isNotEmpty &&
                                              (state.showAllErrors ||
                                                  additionalInformationController
                                                      .text.isNotEmpty)
                                          ? state
                                              .additionalInformationErrorString
                                          : null,
                                    ),
                                  ),
                                ),
                                Text(
                                  state.generalErrorString,
                                  style: TextStyle(
                                      fontSize: 40,
                                      color:
                                          Theme.of(context).colorScheme.error),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              core.OutlinedButton(
                                onPressed: () => context
                                    .read<CreateUserDataBloc>()
                                    .add(CreateUserDataLogout()),
                                child: const Text("Logout"),
                              ),
                              core.DefaultButton(
                                onPressed: state.showAllErrors &&
                                        state.firstNameErrorString.isEmpty &&
                                        state.lastNameErrorString.isEmpty &&
                                        state.birthdateErrorString.isEmpty &&
                                        state.genderErrorString.isEmpty &&
                                        state.dietErrorString.isEmpty &&
                                        state.cityErrorString.isEmpty &&
                                        state.postcodeErrorString.isEmpty &&
                                        state.streetErrorString.isEmpty &&
                                        state.numberErrorString.isEmpty &&
                                        state.additionalInformationErrorString
                                            .isEmpty
                                    ? () => context
                                        .read<CreateUserDataBloc>()
                                        .add(
                                          CreateUserData(
                                            firstName: firstNameController.text,
                                            lastName: lastNameController.text,
                                            birthdate: birthdate,
                                            gender: gender,
                                            diet: diet,
                                            city: cityController.text,
                                            postcode: postcodeController.text,
                                            street: streetController.text,
                                            number: streetnumberController.text,
                                            additionalInformation:
                                                additionalInformationController
                                                    .text,
                                          ),
                                        )
                                    : null,
                                child: const Text("Complete"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }

                  return const Text('Something went wrong.');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
