import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/src/mock.dart';
import 'package:flutter/src/material/icon_button.dart';


void main() {
  group('Homepage navigation tests', () {
      testWidgets('When tapping "VaccineInfoGuide" IconButton should navigate to VaccineInfoGuide page', (WidgetTester tester) async {
          await _buildHomePage(tester);
          await _navigateToVaccineInfoGuidePage(tester);

          var mockObserver;
          verify(mockObserver.didPush(any!, any));
        
          expect(find.byType(IconButton), findsOneWidget);
          expect(find.text('VaccineInfoGuide'), findsOneWidget);
          
          //expect(find.byType(Notification), findsOneWidget);
          //expect(find.byType(ElevatedButton), findsOneWidget);
         
         
         
         //final IconButtonFinder = find.byType(IconButton);
         // expect(IconButtonFinder, findsOneWidget);
      });

    });
}

_navigateToVaccineInfoGuidePage(WidgetTester tester) {
}

_buildHomePage(WidgetTester tester) {
}