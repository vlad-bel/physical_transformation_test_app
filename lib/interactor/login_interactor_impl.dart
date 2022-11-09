import 'package:injectable/injectable.dart';
import 'package:physical_transformation_test_app/domain/repository.dart';
import 'package:physical_transformation_test_app/interactor/login_interactor.dart';

@Singleton(as: LoginInteractor)
class LoginInteractorImpl extends LoginInteractor {
  final Repository repository;

  LoginInteractorImpl(this.repository);

  @override
  Future<bool> login(String login, String password) async {
    return repository.login(login, password);
  }
}
