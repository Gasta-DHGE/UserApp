import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/dependency_provider.dart';

import '../bloc/bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<StatefulWidget> createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

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
                "Sign Up",
                style: Styles.bigHeadlineTextStyle(context),
              ),
              Expanded(
                child: BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    if (DependencyProvider
                        .instance.authenticationService.isLoggedIn) {
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        Navigator.pop(context);
                      });
                    }

                    if (state is SignUpLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is SignUpDefault) {
                      return Column(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                state.generalError.isNotEmpty
                                    ? Text(
                                        state.generalError,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error,
                                        ),
                                      )
                                    : Container(),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: TextField(
                                    controller: emailController,
                                    onChanged: (value) {
                                      context.read<SignUpBloc>().add(
                                            SignUpValuesUpdated(
                                              email: value,
                                              password: passwordController.text,
                                              repeatedPassword:
                                                  repeatPasswordController.text,
                                            ),
                                          );
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'E-Mail',
                                      errorText: state.emailErrorString
                                                  .isNotEmpty &&
                                              emailController.text.isNotEmpty
                                          ? state.emailErrorString
                                          : null,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: TextField(
                                    controller: passwordController,
                                    onChanged: (value) {
                                      context.read<SignUpBloc>().add(
                                            SignUpValuesUpdated(
                                              email: emailController.text,
                                              password: value,
                                              repeatedPassword:
                                                  repeatPasswordController.text,
                                            ),
                                          );
                                    },
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      errorText: state.passwordErrorString
                                                  .isNotEmpty &&
                                              passwordController.text.isNotEmpty
                                          ? state.passwordErrorString
                                          : null,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: TextField(
                                    controller: repeatPasswordController,
                                    onChanged: (value) {
                                      context.read<SignUpBloc>().add(
                                            SignUpValuesUpdated(
                                              email: emailController.text,
                                              password: passwordController.text,
                                              repeatedPassword: value,
                                            ),
                                          );
                                    },
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: 'Repeat Password',
                                      errorText: state.repeatPasswordErrorString
                                              .isNotEmpty
                                          ? state.repeatPasswordErrorString
                                          : null,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              core.OutlinedButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Cancel"),
                              ),
                              core.DefaultButton(
                                onPressed: state.showAllErrors &&
                                        state.emailErrorString.isEmpty &&
                                        state.passwordErrorString.isEmpty &&
                                        state.repeatPasswordErrorString.isEmpty
                                    ? () async {
                                        context.read<SignUpBloc>().add(
                                              SignUp(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text,
                                              ),
                                            );
                                      }
                                    : null,
                                child: const Text("Sign up"),
                              ),
                            ],
                          ),
                        ],
                      );
                    }

                    return const Text('Something went wrong.');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
