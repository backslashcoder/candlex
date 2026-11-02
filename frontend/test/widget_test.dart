import 'package:candlex/core/theme/app_theme.dart';
import 'package:candlex/core/widgets/percentage_change.dart';
import 'package:candlex/core/widgets/score_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _host(Widget child) =>
    MaterialApp(theme: AppTheme.dark, home: Scaffold(body: Center(child: child)));

void main() {
  testWidgets('PercentageChange renders signed value', (tester) async {
    await tester.pumpWidget(_host(const PercentageChange(2.5)));
    expect(find.text('+2.50%'), findsOneWidget);

    await tester.pumpWidget(_host(const PercentageChange(-1.25)));
    expect(find.text('-1.25%'), findsOneWidget);
  });

  testWidgets('ScoreBar renders its numeric value', (tester) async {
    await tester.pumpWidget(_host(const ScoreBar(value: 72)));
    expect(find.text('72'), findsOneWidget);
  });

  testWidgets('RankMovementIndicator shows flat marker at zero',
      (tester) async {
    await tester.pumpWidget(_host(const RankMovementIndicator(0)));
    expect(find.text('—'), findsOneWidget);
  });
}
