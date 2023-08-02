import 'package:flutter/material.dart';
import 'package:gastas_user_app/service_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Text("Login pls"),
          MaterialButton(
            onPressed: () {
              setState(() {
                ServiceProvider.instance.authenticationService.isLoggedIn =
                    true;
              });
            },
            child: Text("Login"),
          )
        ]),
      ),
    );
  }
}
