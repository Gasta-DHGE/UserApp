import 'package:flutter/material.dart';
import 'package:gastas_user_app/controller/app_page_controller.dart';
import 'package:gastas_user_app/observer.dart';
import 'package:gastas_user_app/page/login_page.dart';
import 'package:gastas_user_app/page/shell_page.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<StatefulWidget> createState() => _AppPage();
}

class _AppPage extends State<AppPage> implements Observer {
  static AppPageController controller = AppPageController();

  _AppPage() {
    controller.authenticationService.addObserver(this);
  }
  @override
  Widget build(BuildContext context) {
    return controller.authenticationService.isLoggedIn
        ? ShellPage()
        : LoginPage();
  }

  @override
  void notifyChange(value) {
    setState(() {});
  }

  @override
  void dispose() {
    controller.authenticationService.removeObserver(this);
    super.dispose();
  }
}
