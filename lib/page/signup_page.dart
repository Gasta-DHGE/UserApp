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
            ],
          ),
        ),
      ),
    );
  }
}
