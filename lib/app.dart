import 'package:flutter/material.dart';
import 'package:gastas_core/ui/general/dark_theme.dart';
import 'package:gastas_core/ui/general/light_theme.dart';
import 'package:gastas_user_app/page/app_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => _App();
}

class _App extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const AppPage(),
    );
  }
}
