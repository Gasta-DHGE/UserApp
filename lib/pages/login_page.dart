import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/controller/login_page_controller.dart';
import 'package:gasta_user_app/dependency_provider.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  LoginPageController controller =
      LoginPageController(DependencyProvider.instance.authenticationService);

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
              ListenableBuilder(
                listenable: widget.controller,
                builder: (context, child) => Expanded(
                  child: widget.controller.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: widget.controller.error.isNotEmpty,
                              child: Text(
                                widget.controller.error,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 300,
                                child: TextField(
                                  onChanged: (value) =>
                                      widget.controller.username = value,
                                  decoration: const InputDecoration(
                                      labelText: 'Username'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 300,
                                child: TextField(
                                  onChanged: (value) =>
                                      widget.controller.password = value,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      labelText: 'Password'),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: core.OutlinedButton(
                                    onPressed: () {},
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
