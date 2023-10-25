import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/bloc/bloc.dart';
import 'package:gasta_user_app/page/pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Login",
                style: Styles.bigHeadlineTextStyle(context),
              ),
              Expanded(
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is LoginDefault || state is LoginError) {
                      return Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            state is LoginError
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: 300,
                                      child: Text(
                                        state.errorString,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 300,
                                child: TextField(
                                  controller: usernameController,
                                  decoration: const InputDecoration(
                                      labelText: 'Username'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 300,
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      labelText: 'Password'),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: core.OutlinedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => BlocProvider(
                                            create: (context) => SignUpBloc(),
                                            child: const SignupPage(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text("Sign Up"),
                                  ),
                                ),
                                DefaultButton(
                                  onPressed: () {
                                    context.read<LoginBloc>().add(
                                          Login(
                                            username: usernameController.text,
                                            password: passwordController.text,
                                          ),
                                        );
                                  },
                                  child: const Text("Login"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }

                    return Center(
                      child: Column(
                        children: [
                          const Text('Something went wrong'),
                          core.OutlinedButton(
                            onPressed: () {
                              context.read<LoginBloc>().add(
                                    Logout(),
                                  );
                            },
                            child: const Text('Logout'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
