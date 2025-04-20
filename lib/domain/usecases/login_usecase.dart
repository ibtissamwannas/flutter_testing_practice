import 'package:flutter_testing_app/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository _authRepository;
  LoginUsecase(this._authRepository);
  Future<bool> execute(String email, String password) {
    if (email.isEmpty || password.length < 6) {
      throw ArgumentError('Invalid credentials');
    }
    return _authRepository.login(email, password);
  }
}
