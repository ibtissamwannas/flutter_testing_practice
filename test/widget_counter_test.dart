import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_app/main.dart';

void main() {
  group('test the counter', () {
    testWidgets('should start at 0 and increment on tap', (
      WidgetTester tester,
    ) async {
      // arrage
      await tester.pumpWidget(const Counter());

      // assert
      expect(find.text('Count: 0'), findsOneWidget);
      expect(find.text('Count: 1'), findsNothing);

      // act
      await tester.tap(find.byKey(const Key('increment_button')));
      await tester.pump(); // set state

      // assert
      expect(find.text('Count: 1'), findsOneWidget);
    });

    testWidgets('should increment the counter and reset on tap', (
      WidgetTester tester,
    ) async {
      // arrange
      await tester.pumpWidget(const Counter());

      // act
      await tester.tap(find.byKey(const Key('increment_button')));
      await tester.pump(); // set state

      // assert
      expect(find.text('Count: 1'), findsOneWidget);

      // act
      await tester.tap(find.byKey(const Key('reset_button')));
      await tester.pump(); // set state

      expect(find.text('Count: 0'), findsOneWidget);
      expect(find.text('Count: 1'), findsNothing);
    });
  });
}
