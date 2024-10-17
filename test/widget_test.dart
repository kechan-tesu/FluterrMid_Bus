import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fluttermid_bus/main.dart';

void main() {
  testWidgets('ItemListScreen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the first item is displayed.
    expect(find.text('Anime'), findsOneWidget);

    // Tap the "Details" button for the first item and trigger a frame.
    await tester.tap(find.text('Details').first);
    await tester.pumpAndSettle();

    // Verify that the dialog shows the correct details.
    expect(find.text('Details for Anime'), findsOneWidget);

    // Close the dialog.
    await tester.tap(find.text('Close'));
    await tester.pumpAndSettle();

    // Tap the "Add" button for the first item and trigger a frame.
    await tester.tap(find.text('Add').first);
    await tester.pump();

    // Verify that the button text changes to "Added".
    expect(find.text('Added'), findsOneWidget);
  });
}
