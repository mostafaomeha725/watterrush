import 'package:flutter_test/flutter_test.dart';

import 'package:waterrush/main.dart';

void main() {
  testWidgets('DefaultApp builds smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const DefaultApp());
    await tester.pump();

    expect(find.byType(DefaultApp), findsOneWidget);
  });
}
