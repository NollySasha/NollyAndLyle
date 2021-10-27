import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homepage_project/feature/home_page/presentaion/bloc/auth_bloc.dart';
import 'package:flutter_homepage_project/feature/home_page/presentaion/bloc/auth_event.dart';
import 'package:flutter_homepage_project/feature/home_page/presentaion/bloc/auth_state.dart';
import 'package:flutter_homepage_project/feature/home_page/presentaion/pages/home_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/src/material/flutter_logo.dart';
import 'package:bloc_test/bloc_test.dart';

class MockNavigationObserver extends Mock implements NavigatorObserver {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class AuthStateFake extends Fake implements AuthState {}

class AuthEventFake extends Fake implements AuthEvent {}

void main() {
  group('HomePage navigation tests', () {
    late NavigatorObserver mockObserver;

    setUpAll(() {
      mockObserver = MockNavigationObserver();
      registerFallbackValue<AuthState>(AuthStateFake());
      registerFallbackValue<AuthEvent>(AuthEventFake());
    });

    Future<void> _buildHomePage(WidgetTester tester) async {
      final mock = new MockAuthBloc();
      when(() => mock.state).thenReturn(LoggedIn());

      await tester.pumpWidget(BlocProvider<AuthBloc>(
          create: (context) => mock,
          child: MaterialApp(
            home: HomePage(),
            navigatorObservers: [mockObserver],
          )));

      await tester.pumpAndSettle();
    }

    Future<void> _navigateToVaccineInfoGuidePage(WidgetTester tester) async {
      await tester.tap(find.byKey(HomePage.navigateToVaccineInfoGuid));
      await tester.pumpAndSettle();
    }

    Future<void> _navigateToBookNowPage(WidgetTester tester) async {
      await tester.tap(find.byKey(HomePage.navigateToBookNow));
      await tester.pumpAndSettle();
    }

    Future<void> _navigateToNotificationsPage(WidgetTester tester) async {
      await tester.tap(find.byKey(HomePage.navigateToNotifications));
      await tester.pumpAndSettle();
    }

    testWidgets(
        'When tapping "VaccineInfoGuide" IconButton should navigate to VaccineInfoGuide page',
        (WidgetTester tester) async {
      await _buildHomePage(tester);
      await _navigateToVaccineInfoGuidePage(tester);

      expect(find.byType(FlutterLogo), findsOneWidget);
    });

    testWidgets(
        'When tapping "Book Now" button should navigate to BookNow page',
        (WidgetTester tester) async {
      await _buildHomePage(tester);
      await _navigateToBookNowPage(tester);

      expect(find.byType(FlutterLogo), findsOneWidget);
    });

    testWidgets(
        'When tapping "Notifications" icon should navigate to Notifications page',
        (WidgetTester tester) async {
      await _buildHomePage(tester);
      await _navigateToNotificationsPage(tester);

      expect(find.byType(FlutterLogo), findsOneWidget);
    });
  });
}
