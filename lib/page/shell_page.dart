import 'package:flutter/material.dart';
import 'package:gasta_user_app/dependency_provider.dart';
import 'package:gasta_user_app/page/create_user_data_page.dart';
import 'package:gasta_user_app/page/pages.dart';

class ShellPage extends StatefulWidget {
  const ShellPage({super.key});

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
        _content = const CouponPage();
        break;
      case 1:
        _content = const ScannerPage();
        break;
      case 2:
        _content = const MapPage();
        break;
      case 3:
        _content = const SettingsPage();
        break;
    }

    return ListenableBuilder(
      listenable: DependencyProvider.instance.authenticationService,
      builder: (BuildContext context, Widget? child) {
        return DependencyProvider
                .instance.authenticationService.hasGastaUserData
            ? Scaffold(
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
              )
            : const CreateUserDataPage();
      },
    );
  }
}
