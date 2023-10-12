import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';

import '../controller/settings_page_controller.dart';

// ignore: must_be_immutable
class SettingsPage extends StatefulWidget {
  SettingsPageController controller;
  SettingsPage({super.key, required this.controller});

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
              child: widget.controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : DefaultButton(
                      onPressed: () {
                        setState(() {
                          widget.controller.logoutAsync();
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
