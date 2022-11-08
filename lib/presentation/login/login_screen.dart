import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physical_transformation_test_app/presentation/login/cubit/login_cubit.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Physical Transformation Test App",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 64,
                ),
                FormTextField(
                  name: LoginScreenCubit.loginField,
                  label: "Login",
                ),
                SizedBox(height: 8,),
                FormTextField(
                  name: LoginScreenCubit.passwordField,
                  label: "Password",
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.blue,
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
