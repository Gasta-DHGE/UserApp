import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gastas_user_app/utility/observer.dart';

import '../controller/settings_page_controller.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> implements Observer {
  static var controller = SettingsPageController();
  _SettingsPage() {
    controller.isLoading.addObserver(this);
  }

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
              child: controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : DefaultButton(
                      onPressed: () {
                        setState(() {
                          controller.logoutAsync();
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
