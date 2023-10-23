import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gasta_user_app/dependency_provider.dart';
import 'package:gasta_user_app/page/login_page.dart';
import 'package:gasta_user_app/page/shell_page.dart';

import '../bloc/bloc.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<StatefulWidget> createState() => _AppPage();
}

class _AppPage extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(
          create: (context) => CouponsBloc()
            ..add(
              LoadCoupons(
                userId: DependencyProvider
                    .instance.authenticationService.firebaseUser.uid,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => SavedSurveysBloc()
            ..add(
              LoadSavedSurveys(
                userId: DependencyProvider
                    .instance.authenticationService.firebaseUser.uid,
              ),
            ),
        ),
        BlocProvider(create: (context) => ScannerBloc()),
      ],
      child: ListenableBuilder(
        listenable: DependencyProvider.instance.authenticationService,
        builder: (context, child) {
          return DependencyProvider.instance.authenticationService.isLoggedIn
              ? const ShellPage()
              : LoginPage();
        },
      ),
    );
  }
}
