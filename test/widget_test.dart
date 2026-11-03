import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jamali_pizzaria/main.dart';
import 'package:jamali_pizzaria/routes.dart';

Future<void> pumpApp(WidgetTester tester) async {
  tester.view.physicalSize = const Size(800, 2000);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  await tester.pumpWidget(const JamaliPizzariaApp());
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('home page content', (tester) async {
    await pumpApp(tester);

    expect(find.text('Jamali Pizzaria'), findsOneWidget);
    expect(find.byType(OutlinedButton), findsNWidgets(3));
    expect(find.byTooltip('Twitter / X'), findsOneWidget);
    expect(find.byTooltip('Facebook'), findsOneWidget);
  });

  testWidgets('menu page lists every pizza', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.text('Menu'));
    await tester.pumpAndSettle();

    expect(find.text('Our Menu'), findsOneWidget);
    expect(find.text('Hawaiian Pizza'), findsOneWidget);
    expect(find.text('Pepperoni Pizza'), findsOneWidget);
    expect(find.text('Secret Mushroom Pizza'), findsOneWidget);
    expect(find.text('Baked Bacon with Cheese'), findsOneWidget);
    expect(find.text('Margarita Pizza'), findsOneWidget);
    expect(find.text('RM 24.90'), findsOneWidget);
  });

  testWidgets('about page opens and goes back', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.text('About Us'));
    await tester.pumpAndSettle();
    expect(find.text('Welcome to Jamali Pizzaria'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.byType(OutlinedButton), findsNWidgets(3));
  });

  testWidgets('contact page shows contact details', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.text('Contact Us'));
    await tester.pumpAndSettle();

    expect(find.text('0136376972'), findsOneWidget);
    expect(find.text('faridpizza@gmail.com'), findsOneWidget);
  });

  testWidgets('all six named routes are registered', (tester) async {
    await pumpApp(tester);

    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(
      app.routes.keys,
      containsAll(<String>[
        AppRoutes.home,
        AppRoutes.menu,
        AppRoutes.about,
        AppRoutes.contact,
        AppRoutes.twitter,
        AppRoutes.facebook,
      ]),
    );
  });
}
