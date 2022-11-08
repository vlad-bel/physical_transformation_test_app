import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:physical_transformation_test_app/presentation/login/cubit/login_state.dart';
import 'package:reactive_forms/reactive_forms.dart';

@singleton
class LoginScreenCubit extends Cubit<LoginState> {
  LoginScreenCubit() : super(LoginState.init());

  static const loginField = 'login_field';
  static const passwordField = 'password_field';

  final formGroup = fb.group({
    loginField: FormControl<String>(
      validators: [
        Validators.minLength(2),
        Validators.maxLength(128),
        Validators.required,
      ],
    ),
    passwordField: FormControl<String>(
      validators: [
        Validators.minLength(2),
        Validators.maxLength(128),
        Validators.required,
      ],
    ),
  });
}
