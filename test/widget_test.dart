// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // Wrap with ProviderScope because PortfolioApp expects it (or main.dart wraps it).
    // Actually main.dart wraps it. But in test we must wrap it manually.
    await tester.pumpWidget(const ProviderScope(child: PortfolioApp()));
  });
}
