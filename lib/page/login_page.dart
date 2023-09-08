import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';

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
          child: Column(children: [
            Row(children: [
              Text(
                "Login",
                style: TextStyles.bigHeadlineTextStyle(context),
              ),
            ]),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: widget.controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : DefaultButton(
                        onPressed: () {
                          setState(() {
                            widget.controller.loginAsync();
                          });
                        },
                        child: const Text("Login"),
                      ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
