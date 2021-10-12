import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_homepage_project/screens/book_now.dart';
import 'package:flutter_homepage_project/screens/home_page.dart';
import 'package:flutter_homepage_project/screens/notifications.dart';
import 'package:flutter_homepage_project/screens/vaccine_info_guide.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/src/mock.dart';
import 'home_page_test.mocks.dart';

class MockNavigationObserver extends Mock implements NavigatorObserver {}

void main() {
  group('HomePage navigation tests', () {
    late NavigatorObserver mockObserver;

    setUp(() {
      mockObserver = MockNavigationObserver();
    });

    Future<void> _buildHomePage(WidgetTester tester) async {
      final secureStorage = MockSecureStorage();
      when(secureStorage.isLoggedIn()).thenReturn(true);

      await tester.pumpWidget(MaterialApp(
        home: HomePage(storage: secureStorage),
        navigatorObservers: [mockObserver],
      ));
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

      expect(find.byType(VaccineInfoGuide), findsOneWidget);
    });

    testWidgets('When tapping "Book Now" button should navigate to BookNow page', 
    (WidgetTester tester) async {
    await _buildHomePage(tester);
    await _navigateToBookNowPage(tester);

    expect(find.byType(BookNow), findsOneWidget);
    });

    testWidgets('When tapping "Notifications" icon should navigate to Notifications page', 
    (WidgetTester tester) async {
      await _buildHomePage(tester);
      await _navigateToNotificationsPage(tester);

      expect(find.byType(Notifications), findsOneWidget);
    });

  });
}
