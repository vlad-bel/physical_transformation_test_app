import 'package:injectable/injectable.dart';
import 'package:physical_transformation_test_app/domain/repository.dart';

const testLogin = "admin";
const testPassword = "admin";

@Singleton(as: Repository)
class MockRepository extends Repository {
  @override
  Future<bool> login(String login, String password) async {
    if (login == testLogin && password == testPassword) {
      return true;
    }
    return false;
  }
}
