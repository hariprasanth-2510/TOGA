import 'package:flutter_test/flutter_test.dart';
import 'package:toga/app/app.dart';
import 'package:toga/main.dart';

void main() {
  testWidgets('TOGA initializes successfully', (tester) async {
    await tester.pumpWidget(
      const TogaApp(
        home: HomeScreen(),
      ),
    );

    expect(find.text('TOGA'), findsOneWidget);
    expect(find.textContaining('Architecture configured.'), findsOneWidget);
  });
}
