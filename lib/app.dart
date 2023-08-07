import 'package:flutter/material.dart';
import 'package:gastas_core/ui/general/themes.dart';
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
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      home: const AppPage(),
    );
  }
}
