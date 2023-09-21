import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_core/gasta_core.dart' as core;

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
                style: TextStyles.bigHeadlineTextStyle(context),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: widget.controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 300,
                              child: TextField(
                                controller: TextEditingController(
                                    text: widget.controller.username),
                                onChanged: (value) =>
                                    widget.controller.username = value,
                                decoration: const InputDecoration(
                                  hintText: 'Username',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    borderSide: BorderSide(
                                        color: Colors.greenAccent, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    borderSide: BorderSide(
                                        color: Colors.greenAccent, width: 2.0),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 300,
                              child: TextField(
                                controller: TextEditingController(
                                    text: widget.controller.password),
                                onChanged: (value) =>
                                    widget.controller.password = value,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: 'Password',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    borderSide: BorderSide(
                                        color: Colors.greenAccent, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    borderSide: BorderSide(
                                        color: Colors.greenAccent, width: 2.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                core.OutlinedButton(
                                  onPressed: () {
                                    setState(() {});
                                  },
                                  child: const Text("Sign Up"),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                DefaultButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.controller.loginAsync();
                                    });
                                  },
                                  child: const Text("Login"),
                                ),
                              ],
                            ),
                          ],
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
