  import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_test/flutter_test.dart';
  import 'package:flutter_homepage_project/carousel.dart';
  

  void main() {
    testWidgets('Carousel has four cards',(WidgetTester tester)async{
        Carousel widget = new Carousel();
        await tester.pumpWidget(MaterialApp(
          home: Material(
            child: widget,
          ),
        ));
       
        final carouselSliderFinder = find.byType(CarouselSlider);
        final rowFinder = find.byType(Row);
      
        expect(carouselSliderFinder, findsOneWidget);
        expect(rowFinder, findsOneWidget);
        


    });

    }
