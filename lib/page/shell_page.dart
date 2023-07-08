import 'package:flutter/material.dart';
import 'package:gastas_user_app/page/coupon_page.dart';
import 'package:gastas_user_app/page/map_page.dart';
import 'package:gastas_user_app/page/scanner_page.dart';
import 'package:gastas_user_app/page/settings_page.dart';
import 'package:gastas_user_app/page/testPage.dart';

class ShellPage extends StatefulWidget {
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
        _content = CouponPage();
        break;
      case 1:
        _content = ScannerPage();
        break;
      case 2:
        _content = MapPage();
        break;
      case 3:
        _content = SettingsPage();
        break;
      case 4:
        _content = TestPage();
        break;
    }

    return Scaffold(
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentpage,
          onDestinationSelected: (value) =>
              setState(() => _currentpage = value),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.percent), label: "Coupons"),
            NavigationDestination(icon: Icon(Icons.qr_code), label: "Scanner"),
            NavigationDestination(icon: Icon(Icons.map), label: "Map"),
            NavigationDestination(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
        body: SafeArea(
          child: _content!,
        ));
  }
}
