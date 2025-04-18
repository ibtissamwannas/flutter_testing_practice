import 'package:flutter_test/flutter_test.dart';

int divide(int a, int b) {
  if (b == 0) throw ArgumentError('cannot divide by zero');
  return a ~/ b;
}

// Don’t cram everything into one line — it makes the test hard to read:
void main() {
  test('show divide two numbers', () {
    // arrange
    final a = 10;
    final b = 5;

    // act
    final result = divide(a, b);

    // assert
    expect(result, 2);
  });

  test('show throw an argument error when divide by zero', () {
    // arrange
    final a = 10;
    final b = 0;
    // act + assert
    expect(() => divide(a, b), throwsA(isA<ArgumentError>()));
  });

  test('show throw an error when divide over 0', () {
    // arrange
    final a = 10;
    final b = 0;
    // assert
    expect(() => divide(a, b), throwsA(isA<ArgumentError>()));
  });
}
