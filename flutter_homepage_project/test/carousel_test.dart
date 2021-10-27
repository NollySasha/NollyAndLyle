import 'package:flutter/material.dart';
import 'package:flutter_homepage_project/feature/home_page/presentaion/widgets/carousel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  testWidgets('Carousel is rendered correctly', (WidgetTester tester) async {
    Carousel widget = new Carousel();
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: widget,
      ),
    ));

    final carouselSliderFinder = find.byType(CarouselSlider);
    final rowFinder = find.byType(Row);
    final cardFinder = find.byType(Image);

    expect(carouselSliderFinder, findsOneWidget);
    expect(rowFinder, findsOneWidget);
    expect(cardFinder, findsOneWidget);
  });
}
