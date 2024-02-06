import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/dependency_provider.dart';
import 'package:gasta_user_app/pages/debug_page.dart';
import 'package:gasta_user_app/pages/login_page.dart';

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
      home: ListenableBuilder(
        listenable: DependencyProvider.instance.authenticationService,
        builder: (context, child) =>
            DependencyProvider.instance.authenticationService.user == null
                ? LoginPage()
                : const DebugPage(),
      ),
    );
  }
}
