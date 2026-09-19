import 'package:flutter_test/flutter_test.dart';
import 'package:toga/app/app.dart';

void main() {
  testWidgets('TOGA initializes successfully', (tester) async {
    await tester.pumpWidget(TogaApp());
    await tester.pumpAndSettle();

    expect(
      find.text('Training Operations & Guided Assessment'),
      findsOneWidget,
    );

    expect(
      find.text('Open Learn'),
      findsOneWidget,
    );
  });
}
