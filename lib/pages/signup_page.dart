import 'package:flutter/material.dart';
import 'package:gasta_user_app/controller/controller.dart';

// ignore: must_be_immutable
class SignupPage extends StatefulWidget {
  SignupPage({super.key});
  SignupPageController controller = SignupPageController();

  @override
  State<StatefulWidget> createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return const Text('SignupPage');
  }
}
