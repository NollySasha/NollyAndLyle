import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homepage_project/bloc/auth_bloc.dart';
import 'package:flutter_homepage_project/bloc/auth_event.dart';
import 'package:flutter_homepage_project/bloc/auth_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_homepage_project/widgets/carousel.dart';
import 'package:flutter_homepage_project/screens/home_page.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class AuthStateFake extends Fake implements AuthState {}

class AuthEventFake extends Fake implements AuthEvent {}

void main() {
  setUpAll(() {
    registerFallbackValue<AuthState>(AuthStateFake());
    registerFallbackValue<AuthEvent>(AuthEventFake());
  });

  testWidgets('Homepage is rendered correctly when user is logged in',
      (WidgetTester tester) async {
    final mock = new MockAuthBloc();
    when(() => mock.state).thenReturn(LoggedIn());

    HomePage widget = new HomePage();

    await tester.pumpWidget(BlocProvider<AuthBloc>(
        create: (context) => mock,
        child: MaterialApp(
          home: Material(child: widget),
        )));

    await tester.pumpAndSettle();

    final circleNotificationsIconFinder =
        find.byIcon(Icons.circle_notifications);
    final welcomeTextFinder = find.text('Welcome');
    final vaccineInfoGuideTextFinder = find.text(
        'Vaccine Information Guide \n\n 100 + information on \n immunizations and vaccines');
    final imageFinder = find.byType(Image);
    final articleIconsFinder = find.byIcon(Icons.article);
    final funcFactsTextFinder = find.text("Fun Facts");
    final carouselWidgetFinder = find.byType(Carousel);
    final bookNowButtonFinder = find.byType(ElevatedButton);

    expect(welcomeTextFinder, findsOneWidget);

    expect(vaccineInfoGuideTextFinder, findsOneWidget);
    expect(imageFinder, findsNWidgets(2));
    expect(articleIconsFinder, findsOneWidget);
    expect(funcFactsTextFinder, findsOneWidget);
    expect(carouselWidgetFinder, findsOneWidget);
    expect(bookNowButtonFinder, findsOneWidget);
    expect(circleNotificationsIconFinder, findsOneWidget);
  });

  testWidgets('Homepage is rendered correctly when user is not logged in',
      (WidgetTester tester) async {
    final mock = new MockAuthBloc();
    when(() => mock.state).thenReturn(NotLoggedIn());

    HomePage widget = new HomePage();

    await tester.pumpWidget(BlocProvider<AuthBloc>(
        create: (context) => mock,
        child: MaterialApp(
          home: Material(child: widget),
        )));

    await tester.pumpAndSettle();

    final circleNotificationsIconFinder =
        find.byIcon(Icons.circle_notifications);
    final welcomeTextFinder = find.text('Welcome');
    final vaccineInfoGuideTextFinder = find.text(
        'Vaccine Information Guide \n\n 100 + information on \n immunizations and vaccines');
    final imageFinder = find.byType(Image);
    final articleIconsFinder = find.byIcon(Icons.article);
    final funcFactsTextFinder = find.text("Fun Facts");
    final carouselWidgetFinder = find.byType(Carousel);
    final bookNowButtonFinder = find.byType(ElevatedButton);

    expect(circleNotificationsIconFinder, findsNothing);
    expect(welcomeTextFinder, findsOneWidget);
    expect(vaccineInfoGuideTextFinder, findsOneWidget);
    expect(imageFinder, findsNWidgets(2));
    expect(articleIconsFinder, findsOneWidget);
    expect(funcFactsTextFinder, findsOneWidget);
    expect(carouselWidgetFinder, findsOneWidget);
    expect(bookNowButtonFinder, findsOneWidget);
  });
}
