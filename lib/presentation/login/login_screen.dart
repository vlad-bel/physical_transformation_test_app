import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physical_transformation_test_app/presentation/auth_page/auth_page.dart';
import 'package:physical_transformation_test_app/presentation/login/cubit/login_cubit.dart';
import 'package:physical_transformation_test_app/presentation/login/cubit/login_state.dart';
import 'package:physical_transformation_test_app/util/form_text_field.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReactiveFormBuilder(
        builder: (BuildContext context, FormGroup formGroup, Widget? child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Physical Transformation Test App",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 64,
                ),
                const FormTextField(
                  name: LoginScreenCubit.loginField,
                  label: "Login",
                ),
                const SizedBox(
                  height: 8,
                ),
                const FormTextField(
                  name: LoginScreenCubit.passwordField,
                  label: "Password",
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                ReactiveFormConsumer(
                  builder: (
                    BuildContext context,
                    FormGroup formGroup,
                    Widget? child,
                  ) {
                    return BlocConsumer<LoginScreenCubit, LoginState>(
                      listener: (context, state) {
                        state.when(
                          init: () {},
                          sucess: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const AuthPage(authed: true);
                                },
                              ),
                            );
                          },
                          error: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const AuthPage(authed: false);
                                },
                              ),
                            );
                          },
                        );
                      },
                      builder: (BuildContext context, state) {
                        return CupertinoButton(
                          onPressed: formGroup.valid
                              ? () {
                                  final loginScreenCubit =
                                      BlocProvider.of<LoginScreenCubit>(
                                          context);

                                  loginScreenCubit.login();
                                }
                              : null,
                          color: Colors.blue,
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 32),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Note: correct creds:\nlogin:admin\npassword:admin",
                  ),
                ),
              ],
            ),
          );
        },
        form: () {
          final loginScreenCubit = BlocProvider.of<LoginScreenCubit>(context);
          return loginScreenCubit.formGroup;
        },
      ),
    );
  }
}
