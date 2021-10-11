import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_homepage_project/widgets/carousel.dart';
import 'package:flutter_homepage_project/screens/home_page.dart';

import 'package:mockito/annotations.dart';
import 'package:flutter_homepage_project/shared/secure_storage.dart';
import 'package:mockito/mockito.dart';

import 'home_page_test.mocks.dart';

@GenerateMocks([SecureStorage])
void main() {
  testWidgets('Homepage is rendered correctly when user is logged in',
      (WidgetTester tester) async {
    final secureStorage = MockSecureStorage();
    when(secureStorage.isLoggedIn()).thenReturn(true);

    HomePage widget = new HomePage(storage: secureStorage);

    await tester.pumpWidget(MaterialApp(
      home: Material(child: widget),
    ));

    final circleNotificationsIconFinder =
        find.byIcon(Icons.circle_notifications);
    final welcomeTextFinder = find.text('Welcome');
    final howVaccinesWorkTextFinder = find.text('How Vaccines Work');
    final vaccineInfoGuideTextFinder =
        find.text('Vaccine \nInformation \nGuide');
    final imageFinder = find.byType(Image);
    final articleIconsFinder = find.byIcon(Icons.article);
    final funcFactsTextFinder = find.text("Fun Facts");
    final carouselWidgetFinder = find.byType(Carousel);
    final bookNowButtonFinder = find.byType(ElevatedButton);

    expect(circleNotificationsIconFinder, findsOneWidget);
    expect(welcomeTextFinder, findsOneWidget);
    expect(howVaccinesWorkTextFinder, findsOneWidget);
    expect(vaccineInfoGuideTextFinder, findsOneWidget);
    expect(imageFinder, findsNWidgets(2));
    expect(articleIconsFinder, findsOneWidget);
    expect(funcFactsTextFinder, findsOneWidget);
    expect(carouselWidgetFinder, findsOneWidget);
    expect(bookNowButtonFinder, findsOneWidget);
  });

  testWidgets('Homepage is rendered correctly when user is not logged in',
      (WidgetTester tester) async {
    final secureStorage = MockSecureStorage();
    when(secureStorage.isLoggedIn()).thenReturn(false);

    HomePage widget = new HomePage(storage: secureStorage);

    await tester.pumpWidget(MaterialApp(
      home: Material(child: widget),
    ));

    final circleNotificationsIconFinder =
        find.byIcon(Icons.circle_notifications);
    final welcomeTextFinder = find.text('Welcome');
    final howVaccinesWorkTextFinder = find.text('How Vaccines Work');
    final vaccineInfoGuideTextFinder =
        find.text('Vaccine \nInformation \nGuide');
    final imageFinder = find.byType(Image);
    final articleIconsFinder = find.byIcon(Icons.article);
    final funcFactsTextFinder = find.text("Fun Facts");
    final carouselWidgetFinder = find.byType(Carousel);
    final bookNowButtonFinder = find.byType(ElevatedButton);

    expect(circleNotificationsIconFinder, findsNothing);
    expect(welcomeTextFinder, findsOneWidget);
    expect(howVaccinesWorkTextFinder, findsOneWidget);
    expect(vaccineInfoGuideTextFinder, findsOneWidget);
    expect(imageFinder, findsNWidgets(2));
    expect(articleIconsFinder, findsOneWidget);
    expect(funcFactsTextFinder, findsOneWidget);
    expect(carouselWidgetFinder, findsOneWidget);
    expect(bookNowButtonFinder, findsNothing);
  });
}