import 'package:flutter/material.dart';
import 'package:flutter_football_test/error_with_refresh.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ErrorRefresh', () {
    testWidgets('displays errorText', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ErrorRefresh(onPressed: () {}, errorText: 'error text'),
        ),
      );

      expect(find.text('error text'), findsOneWidget);
    });

    testWidgets('triggers onPressed', (WidgetTester tester) async {
      bool _hasTriggered = false;

      await tester.pumpWidget(
        MaterialApp(
          home: ErrorRefresh(
            onPressed: () {
              _hasTriggered = true;
            },
            errorText: '',
          ),
        ),
      );

      expect(_hasTriggered, false);

      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pump();

      expect(_hasTriggered, true);
    });
  });
}
