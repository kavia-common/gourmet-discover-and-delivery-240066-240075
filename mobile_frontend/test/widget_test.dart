import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_frontend/main.dart';
import 'package:mobile_frontend/services/local_storage_service.dart';
import 'package:mobile_frontend/state/app_state.dart';

void main() {
  testWidgets('App renders shell with Home tab', (WidgetTester tester) async {
    final storage = await LocalStorageService.create();
    final state = await AppState.create(storage);

    await tester.pumpWidget(MyApp(appState: state));
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);
    expect(find.text('Orders'), findsOneWidget);
    expect(find.text('Account'), findsOneWidget);
  });
}
