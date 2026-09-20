import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toga/app/app.dart';

void main() {
  testWidgets('TOGA initializes successfully', (tester) async {
    await tester.pumpWidget(ProviderScope(child: TogaApp()));
    // The dashboard deliberately starts an asynchronous local-database read.
    // A single frame is sufficient to verify that the application shell is
    // usable without waiting for that background operation to settle.
    await tester.pump();

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
