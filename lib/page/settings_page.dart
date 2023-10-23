import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/bloc/bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(children: [
            Text(
              "Settings",
              style: Styles.bigHeadlineTextStyle(context),
            ),
          ]),
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return DefaultButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(
                            Logout(),
                          );
                    },
                    child: const Text("Logout"),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
