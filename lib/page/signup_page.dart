import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/services/services.dart';

import '../controller/controller.dart';

// ignore: must_be_immutable
class SignupPage extends StatefulWidget {
  SignupPageController controller;
  SignupPage({super.key, required this.controller});

  @override
  State<StatefulWidget> createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
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
                  "Sign Up",
                  style: Styles.bigHeadlineTextStyle(context),
                ),
                Visibility(
                  visible: !widget.controller.isLoading,
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: widget.controller.lastSignupResult !=
                              Result.success,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              child: Text(
                                widget.controller.errorString,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            onChanged: (value) =>
                                widget.controller.username = value,
                            decoration: Styles.inputDecoration(
                                error: !widget.controller.isUsernameValid &&
                                    widget.controller.username.isNotEmpty,
                                context: context,
                                labelText: "E-Mail"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            onChanged: (value) =>
                                widget.controller.password = value,
                            obscureText: true,
                            decoration: Styles.inputDecoration(
                                error: !widget.controller.isPasswordValid &&
                                    widget.controller.password.isNotEmpty,
                                context: context,
                                labelText: "Password"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            onChanged: (value) =>
                                widget.controller.repeatedPassword = value,
                            obscureText: true,
                            decoration: Styles.inputDecoration(
                                context: context,
                                labelText: "Repeat Password",
                                error: !widget
                                        .controller.isRepeatedPasswordValid &&
                                    widget.controller.password.isNotEmpty),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.controller.isLoading,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                Visibility(
                  visible: !widget.controller.isLoading,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      core.OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                      core.DefaultButton(
                        onPressed: widget.controller.isUsernameValid &&
                                widget.controller.isPasswordValid &&
                                widget.controller.isRepeatedPasswordValid
                            ? () async {
                                widget.controller.isLoading = true;
                                widget.controller.lastSignupResult =
                                    await widget
                                        .controller.authenticationService
                                        .signupAsync(widget.controller.username,
                                            widget.controller.password);
                                widget.controller.isLoading = false;
                                if (widget.controller.lastSignupResult ==
                                    Result.success) {
                                  // ignore: use_build_context_synchronously
                                  Navigator.pop(context);
                                }
                              }
                            : null,
                        child: const Text("Sign up"),
                      ),
                    ],
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
