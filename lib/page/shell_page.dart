import 'package:flutter/material.dart';
import 'package:gasta_user_app/dependency_provider.dart';
import 'package:gasta_user_app/page/create_user_data_page.dart';
import 'package:gasta_user_app/page/pages.dart';

import '../controller/controller.dart';

// ignore: must_be_immutable
class ShellPage extends StatefulWidget {
  ShellPageController controller;
  ShellPage({super.key, required this.controller});

  @override
  State<StatefulWidget> createState() => _ShellPage();
}

class _ShellPage extends State<ShellPage> {
  Widget? _content;
  int _currentpage = 0;

  @override
  Widget build(BuildContext context) {
    switch (_currentpage) {
      case 0:
        _content = CouponPage(
            controller: DependencyProvider.instance.couponPageController);
        break;
      case 1:
        _content = ScannerPage(
            controller: DependencyProvider.instance.scannerPageController);
        break;
      case 2:
        _content =
            MapPage(controller: DependencyProvider.instance.mapPageController);
        break;
      case 3:
        _content = SettingsPage(
            controller: DependencyProvider.instance.settingsPageController);
        break;
    }

    return ListenableBuilder(
      listenable: widget.controller.authenticationService,
      builder: (BuildContext context, Widget? child) {
        return widget.controller.authenticationService.user!.gastaUser == null
            ? CreateUserDataPage(
                controller: CreateUserDataPageController(
                    authenticationService:
                        DependencyProvider.instance.authenticationService,
                    userService: DependencyProvider.instance.userService),
              )
            : Scaffold(
                bottomNavigationBar: NavigationBar(
                  selectedIndex: _currentpage,
                  onDestinationSelected: (value) =>
                      setState(() => _currentpage = value),
                  destinations: const [
                    NavigationDestination(
                        icon: Icon(Icons.percent),
                        label: "Coupons",
                        tooltip: ""),
                    NavigationDestination(
                        icon: Icon(Icons.qr_code),
                        label: "Scanner",
                        tooltip: ""),
                    NavigationDestination(
                        icon: Icon(Icons.map), label: "Map", tooltip: ""),
                    NavigationDestination(
                        icon: Icon(Icons.settings),
                        label: "Settings",
                        tooltip: ""),
                  ],
                ),
                body: SafeArea(
                  child: _content!,
                ),
              );
      },
    );
  }
}
