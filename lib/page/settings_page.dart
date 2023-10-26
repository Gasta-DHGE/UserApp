import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/dependency_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(children: [
            Text(
              "Settings",
              style: Styles.bigHeadlineTextStyle(context),
            ),
          ]),
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              child: DefaultButton(
                onPressed: () {
                  DependencyProvider.instance.authenticationService
                      .logoutAsync();
                },
                child: const Text("Logout"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
