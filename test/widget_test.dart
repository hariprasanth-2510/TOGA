import 'package:flutter_test/flutter_test.dart';
import 'package:toga/main.dart';

void main() {
  testWidgets('TOGA initializes successfully', (tester) async {
    await tester.pumpWidget(const TogaApp());

    expect(find.text('TOGA'), findsOneWidget);
    expect(find.text('Initial project'), findsOneWidget);
  });
}
