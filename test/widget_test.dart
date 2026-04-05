import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:weather_app/main.dart';

void main() {
  testWidgets('App renders with app bar title', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Slick Weather App'), findsOneWidget);
    expect(find.text('Weather?'), findsOneWidget);
  });
}
