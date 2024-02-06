import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/dependency_provider.dart';

class DebugPage extends StatelessWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: core.OutlinedButton(
          onPressed: () {
            DependencyProvider.instance.authenticationService.logoutAsync();
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
