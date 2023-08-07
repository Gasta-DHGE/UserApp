import 'package:flutter/material.dart';
import 'package:gastas_core/ui/widgets/default_button.dart';
import 'package:gastas_user_app/service_provider.dart';
import 'package:gastas_core/ui/general/text_styles.dart';

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
                child: ServiceProvider
                        .instance.authenticationService.isLoading.value
                    ? const CircularProgressIndicator()
                    : DefaultButton(
                        onPressed: () {
                          setState(() {
                            ServiceProvider.instance.authenticationService
                                .logInAsync();
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
