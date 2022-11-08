import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.init() = InitLoginState;

  const factory LoginState.sucess() = SucessLoginState;

  const factory LoginState.error() =
  ErrorLoginState;
}