import 'package:flutter_test/flutter_test.dart';

int add(int a, int b) {
  return a + b;
}

int subtract(int a, int b) {
  return a - b;
}

int multiplication(int a, int b) {
  return a * b;
}

void main() {
  test('add two number', () {
    final result = add(5, 5);
    expect(result, 10);
  });

  test('subtract two number', () {
    final result = subtract(10, 5);
    expect(result, 5);
  });

  test('multiply two number', () {
    final result = multiplication(5, 5);
    expect(result, 25);
  });
}
