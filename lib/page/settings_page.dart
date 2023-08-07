import 'package:flutter/material.dart';
import 'package:gastas_core/ui/general/text_styles.dart';
import 'package:gastas_core/ui/widgets/default_button.dart';

import '../service_provider.dart';

class SettingsPage extends StatefulWidget {
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
              style: TextStyles.bigHeadlineTextStyle(context),
            ),
          ]),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child:
                  ServiceProvider.instance.authenticationService.isLoading.value
                      ? const CircularProgressIndicator()
                      : DefaultButton(
                          onPressed: () {
                            setState(() {
                              ServiceProvider.instance.authenticationService
                                  .logOutAsync();
                            });
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
