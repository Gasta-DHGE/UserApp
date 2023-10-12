import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gasta_core/gasta_core.dart' as core;

import '../controller/controller.dart';

class CreateUserDataPage extends StatefulWidget {
  final CreateUserDataPageController controller;
  const CreateUserDataPage({super.key, required this.controller});

  @override
  State<StatefulWidget> createState() => _CreateUserDataPage();
}

class _CreateUserDataPage extends State<CreateUserDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListenableBuilder(
            listenable: widget.controller,
            builder: (BuildContext context, Widget? child) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Complete Registration",
                  style: core.Styles.headlineTextStyle(context),
                ),
                Visibility(
                  visible: !widget.controller.isLoading,
                  child: Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp("[a-zA-Z]"),
                              ),
                            ],
                            onChanged: (value) =>
                                widget.controller.firstName = value,
                            decoration: core.Styles.inputDecoration(
                              context: context,
                              error: !widget.controller.isFirstNameValid &&
                                  widget.controller.firstName != '',
                              labelText: "First Name",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp("[a-zA-Z]"),
                              ),
                            ],
                            onChanged: (value) =>
                                widget.controller.lastName = value,
                            decoration: core.Styles.inputDecoration(
                                context: context,
                                error: !widget.controller.isLastNameValid &&
                                    widget.controller.lastName != '',
                                labelText: "Last Name"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            readOnly: true,
                            controller: TextEditingController(
                                text:
                                    "${widget.controller.birthDate.day}.${widget.controller.birthDate.month}.${widget.controller.birthDate.year}"),
                            onTap: () async {
                              widget.controller.birthDate =
                                  (await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now(),
                                      )) ??
                                      DateTime.now();
                              setState(
                                () {},
                              );
                            },
                            decoration: core.Styles.inputDecoration(
                                context: context, labelText: "Birthdate"),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, right: 8.0, bottom: 8.0),
                                child: core.DefaultDropdownButton<core.Gender>(
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
                                  onChanged: (core.Gender? gender) {
                                    widget.controller.gender =
                                        gender ?? core.Gender.male;
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, left: 8.0, bottom: 8.0),
                                child: core.DefaultDropdownButton<core.Diet>(
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
                                  onChanged: (core.Diet? diet) {
                                    widget.controller.diet =
                                        diet ?? core.Diet.everything;
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
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp("[a-zA-Z]"),
                                    ),
                                  ],
                                  onChanged: (value) =>
                                      widget.controller.city = value,
                                  decoration: core.Styles.inputDecoration(
                                    context: context,
                                    error: !widget.controller.isCityValid &&
                                        widget.controller.city != '',
                                    labelText: "City",
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, left: 8.0, bottom: 8.0),
                                child: TextField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  onChanged: (value) =>
                                      widget.controller.postcode = value,
                                  decoration: core.Styles.inputDecoration(
                                    context: context,
                                    error: !widget.controller.isPostcodeValid &&
                                        widget.controller.postcode != '',
                                    labelText: "Postcode",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, right: 8.0, bottom: 8.0),
                                child: TextField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp("[a-zA-Z]"),
                                    ),
                                  ],
                                  onChanged: (value) =>
                                      widget.controller.street = value,
                                  decoration: core.Styles.inputDecoration(
                                    context: context,
                                    error: !widget.controller.isStreetValid &&
                                        widget.controller.street != '',
                                    labelText: "Street",
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, left: 8.0, bottom: 8.0),
                                child: TextField(
                                  controller: TextEditingController(
                                    text: widget.controller.streetnumber
                                        .toString(),
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  onChanged: (value) => setState(() => widget
                                      .controller
                                      .streetnumber = int.tryParse(value) ?? 1),
                                  decoration: core.Styles.inputDecoration(
                                    context: context,
                                    labelText: "Number",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            controller: TextEditingController(
                                text: widget.controller.additionalInformation),
                            onChanged: (value) =>
                                widget.controller.additionalInformation = value,
                            decoration: core.Styles.inputDecoration(
                              context: context,
                              labelText: "Additional Information",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: !widget.controller.isLoading,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      core.OutlinedButton(
                        onPressed: () => widget.controller.authenticationService
                            .logoutAsync(),
                        child: const Text("Logout"),
                      ),
                      core.DefaultButton(
                        onPressed: widget.controller.isDataValid
                            ? () async {
                                widget.controller.isLoading = true;
                                try {
                                  await widget.controller.createUserDataAsync();
                                  // ignore: empty_catches
                                } catch (e) {}
                                widget.controller.isLoading = false;
                              }
                            : null,
                        child: const Text("Complete"),
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: widget.controller.isLoading,
                  child: const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
