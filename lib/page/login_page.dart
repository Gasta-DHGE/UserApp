import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gastas_user_app/utility/observer.dart';

import '../controller/login_page_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> implements Observer {
  static var controller = LoginPageController();
  _LoginPage() {
    controller.isLoading.addObserver(this);
  }

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
                child: controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : DefaultButton(
                        onPressed: () {
                          setState(() {
                            controller.loginAsync();
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

  @override
  void dispose() {
    controller.isLoading.removeObserver(this);
    super.dispose();
  }

  @override
  void onNotify(value) {
    setState(() {});
  }
}
