import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_app/domain/repositories/auth_repository.dart';
import 'package:flutter_testing_app/domain/usecases/login_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late LoginUsecase loginUsecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUsecase = LoginUsecase(mockAuthRepository);
  });

  test('should call login and return true when valid credentials', () async {
    // arrange
    when(
      () => mockAuthRepository.login(any(), any()),
    ).thenAnswer((_) async => true);

    // act
    final result = await loginUsecase.execute('ibtissam@gmail.com', '123456');

    // assets
    expect(result, true);
    verify(
      () => mockAuthRepository.login('ibtissam@gmail.com', '123456'),
    ).called(1);
  });

  test('should throw argumentError when credentials are invalid', () async {
    expect(
      () => loginUsecase.execute('', '123456'),
      throwsA(isA<ArgumentError>()),
    );
  });
}
