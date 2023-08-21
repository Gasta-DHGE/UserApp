import 'package:flutter/material.dart';
import 'package:gastas_user_app/controller/app_page_controller.dart';
import 'package:gastas_user_app/page/login_page.dart';
import 'package:gastas_user_app/page/shell_page.dart';
import 'package:gastas_user_app/utility/observer.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<StatefulWidget> createState() => _AppPage();
}

class _AppPage extends State<AppPage> implements Observer {
  static AppPageController controller = AppPageController();

  _AppPage() {
    controller.authenticationService.isLoggedIn.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return controller.authenticationService.isLoggedIn.value
        ? const ShellPage()
        : const LoginPage();
  }

  @override
  void dispose() {
    controller.authenticationService.isLoggedIn.removeObserver(this);
    super.dispose();
  }

  @override
  void onNotify(value) {
    setState(() {});
  }
}
