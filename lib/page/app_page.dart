import 'package:flutter/material.dart';
import 'package:gasta_user_app/controller/app_page_controller.dart';
import 'package:gasta_user_app/controller/controller.dart';
import 'package:gasta_user_app/dependency_provider.dart';
import 'package:gasta_user_app/page/login_page.dart';
import 'package:gasta_user_app/page/shell_page.dart';

// ignore: must_be_immutable
class AppPage extends StatefulWidget {
  AppPageController controller;
  AppPage({super.key, required this.controller});

  @override
  State<StatefulWidget> createState() => _AppPage();
}

class _AppPage extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.controller.authenticationService,
      builder: (context, child) {
        return widget.controller.authenticationService.isLoggedIn
            ? ShellPage(
                controller: DependencyProvider.instance.shellPageController)
            : LoginPage(
                controller: LoginPageController(
                    authenticationService:
                        DependencyProvider.instance.authenticationService),
              );
      },
    );
  }
}
