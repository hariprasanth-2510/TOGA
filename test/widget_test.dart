import 'package:flutter_test/flutter_test.dart';
import 'package:toga/app/app.dart';

void main() {
  testWidgets('TOGA initializes successfully', (tester) async {
    await tester.pumpWidget(TogaApp());

    expect(find.text('TOGA'), findsOneWidget);
    expect(find.textContaining('Architecture configured.'), findsOneWidget);
  });
}
