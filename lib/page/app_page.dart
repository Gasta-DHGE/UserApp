import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gasta_user_app/dependency_provider.dart';
import 'package:gasta_user_app/page/create_user_data_page.dart';
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
    return ListenableBuilder(
      listenable: DependencyProvider.instance.authenticationService,
      builder: (context, child) {
        if (DependencyProvider.instance.authenticationService.isLoggedIn &&
            DependencyProvider
                .instance.authenticationService.hasGastaUserData) {
          return MultiBlocProvider(providers: [
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
          ], child: const ShellPage());
        }
        if (DependencyProvider.instance.authenticationService.isLoggedIn) {
          return BlocProvider(
            create: (context) => CreateUserDataBloc(),
            child: const CreateUserDataPage(),
          );
        }
        return BlocProvider(
          create: (context) => LoginBloc(),
          child: const LoginPage(),
        );
      },
    );
  }
}
