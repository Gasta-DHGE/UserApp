import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Sign Up",
                style: Styles.bigHeadlineTextStyle(context),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextField(
                        onChanged: (value) =>
                            setState(() => widget.controller.username = value),
                        decoration: Styles.inputDecoration(
                            context: context, hintText: "E-Mail"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextField(
                        onChanged: (value) =>
                            setState(() => widget.controller.password = value),
                        obscureText: true,
                        decoration: Styles.inputDecoration(
                            context: context, hintText: "Password"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextField(
                        onChanged: (value) => setState(
                            () => widget.controller.repeatedPassword = value),
                        obscureText: true,
                        decoration: Styles.inputDecoration(
                            context: context, hintText: "Repeat Password"),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: DefaultButton(
                    disabledColor: Theme.of(context).colorScheme.surface,
                    onPressed: widget.controller.password.length > 5 &&
                            widget.controller.password ==
                                widget.controller.repeatedPassword
                        ? () {
                            widget.controller.authenticationService.signupAsync(
                                widget.controller.username,
                                widget.controller.password);
                          }
                        : null,
                    child: const Text("Sign up"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
