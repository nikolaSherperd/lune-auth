import 'package:flutter_test/flutter_test.dart';
import 'package:lune_auth/main.dart';

void main() {
  testWidgets('LUNE app loads', (tester) async {
    await tester.pumpWidget(const LuneApp());
    expect(find.text('L U N E'), findsOneWidget);
  });
}