import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/services/i_authentication_service.dart';

import '../controller/login_page_controller.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  LoginPageController controller;
  LoginPage({super.key, required this.controller});

  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
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
                "Login",
                style: Styles.bigHeadlineTextStyle(context),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: ValueListenableBuilder(
                    valueListenable: widget.controller.isLoading,
                    builder: (BuildContext context, bool value, Widget? child) {
                      return widget.controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Visibility(
                                  visible: widget.controller
                                          .lastAuthenticationResult !=
                                      AuthenticationResult.success,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: 300,
                                      child: Text(
                                        widget.controller.errorString,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 300,
                                    child: TextField(
                                      controller: TextEditingController(
                                          text: widget.controller.username),
                                      onChanged: (value) =>
                                          widget.controller.username = value,
                                      decoration: Styles.inputDecoration(
                                          context: context,
                                          hintText: "Username"),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 300,
                                    child: TextField(
                                      controller: TextEditingController(
                                          text: widget.controller.password),
                                      onChanged: (value) =>
                                          widget.controller.password = value,
                                      obscureText: true,
                                      decoration: Styles.inputDecoration(
                                          context: context,
                                          hintText: "Password"),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: core.OutlinedButton(
                                        onPressed: () {
                                          setState(() {});
                                        },
                                        child: const Text("Sign Up"),
                                      ),
                                    ),
                                    DefaultButton(
                                      onPressed: () {
                                        widget.controller.loginAsync();
                                      },
                                      child: const Text("Login"),
                                    ),
                                  ],
                                ),
                              ],
                            );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
