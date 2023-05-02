// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:mus_app/main.dart';
import 'package:mus_app/routes/routes.dart';
import 'package:mus_app/services/new_post/pages/new_post.dart';
import 'package:mus_app/services/registration/pages/login_page.dart';




void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MultiBlocProvider(
      providers: ProviderList.providers,
      child: MaterialApp(
        title: 'Mine Is Yours',
        // initialRoute: Routes.onBoarding,
        navigatorKey: RouterGenerator.navigatorState,
        onGenerateRoute: RouterGenerator.generateRoutes,
        navigatorObservers: [RouterGenerator.routeObserver],
        debugShowCheckedModeBanner: false,

        home: NewPostPage(),
      ),
    ));
    tester.tap(find.byKey(Key("testing")));
    tester.pump();
    expect(find.byKey(Key("testing")), findsOneWidget);
    // expect(find.text('1'), findsOneWidget);
  });

  testWidgets("description", (WidgetTester tester) async{
    await tester.pumpWidget(MultiBlocProvider(
      providers: ProviderList.providers,
      child: MaterialApp(
        title: 'Mine Is Yours',
        // initialRoute: Routes.onBoarding,
        navigatorKey: RouterGenerator.navigatorState,
        onGenerateRoute: RouterGenerator.generateRoutes,
        navigatorObservers: [RouterGenerator.routeObserver],
        debugShowCheckedModeBanner: false,

        home: LoginPage(),
      ),
    ));
    expect(find.text("Forget Password?"), findsOneWidget);
    expect(find.byKey(Key("btn")), findsOneWidget);
    expect(find.byKey(Key("email")), findsOneWidget);
    await tester.enterText(find.byKey(Key("email")), "email");
    expect(find.byKey(Key("password")), findsOneWidget);
    await tester.enterText(find.byKey(Key("email")), "password");
    await tester.tap(find.byKey(Key("btn")));
    await tester.pump();
    verify(RouterGenerator.pop()).called(1);
  });
}
