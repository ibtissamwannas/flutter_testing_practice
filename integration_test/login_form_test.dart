import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_app/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('should login and see sucuess message', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(
      find.byKey(const Key('email_field')),
      'ibtissam@gmail.com',
    );
    await tester.enterText(find.byKey(const Key('password_field')), '123456');
    await tester.tap(find.byKey(const Key('submit_button')));
    await tester.pumpAndSettle();
    expect(find.text('ok'), findsOneWidget);
  });
}


// Method	Use When...
// pump()	You just want to trigger a rebuild once
// pumpAndSettle()	You want to wait for animations or SnackBars