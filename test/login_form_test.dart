import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_app/login_form.dart'; // adjust import to match your app name

void main() {
  testWidgets('show an error when fields are empty', (
    WidgetTester tester,
  ) async {
    // arrange
    await tester.pumpWidget(const LoginForm());

    // act
    await tester.tap(find.byKey(const Key('submit_button')));
    await tester.pump();

    // assert
    expect(find.text('Email is required'), findsOneWidget);
    expect(find.text('Password too short'), findsOneWidget);
  });

  testWidgets('should return an error when email is empty', (
    WidgetTester tester,
  ) async {
    // arrange
    await tester.pumpWidget(LoginForm());

    // act
    await tester.enterText(find.byKey(const Key('email_field')), '');
    await tester.tap(find.byKey(const Key('submit_button')));
    await tester.pump();

    // assert
    expect(find.text('Email is required'), findsOneWidget);
  });

  testWidgets('passes validation with correct inputs', (
    WidgetTester tester,
  ) async {
    // arrange
    await tester.pumpWidget(const LoginForm());

    // act
    await tester.enterText(
      find.byKey(const Key('email_field')),
      'test@email.com',
    );
    await tester.enterText(find.byKey(const Key('password_field')), '123456');
    await tester.tap(find.byKey(const Key('submit_button')));
    await tester.pump();

    // assert
    expect(find.text('Email is required'), findsNothing);
    expect(find.text('Password too short'), findsNothing);
  });
}
