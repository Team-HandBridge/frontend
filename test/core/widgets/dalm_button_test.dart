import 'package:dalm/app/theme/dalm_colors.dart';
import 'package:dalm/app/theme/dalm_theme.dart';
import 'package:dalm/core/widgets/dalm_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> pumpButton(
    WidgetTester tester, {
    required DalmButton button,
    double width = 350,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: DalmTheme.light,
        home: Scaffold(
          body: Center(
            child: SizedBox(width: width, child: button),
          ),
        ),
      ),
    );
  }

  testWidgets('부모 너비를 채우고 높이는 56이다', (tester) async {
    await pumpButton(
      tester,
      width: 280,
      button: DalmButton(label: '다음', onPressed: () {}),
    );

    expect(tester.getSize(find.byType(FilledButton)), const Size(280, 56));
  });

  testWidgets('loading 중에는 indicator를 표시하고 중복 클릭을 막는다', (tester) async {
    var pressCount = 0;

    await pumpButton(
      tester,
      button: DalmButton(
        label: '처리 중',
        onPressed: () => pressCount++,
        isLoading: true,
      ),
    );

    final button = tester.widget<FilledButton>(find.byType(FilledButton));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('처리 중'), findsNothing);
    expect(button.onPressed, isNull);

    await tester.tap(find.byType(FilledButton));
    expect(pressCount, 0);
  });

  testWidgets('onPressed가 null이면 비활성화된다', (tester) async {
    await pumpButton(
      tester,
      button: const DalmButton(label: '비활성화', onPressed: null),
    );

    final button = tester.widget<FilledButton>(find.byType(FilledButton));
    final disabledStates = <WidgetState>{WidgetState.disabled};

    expect(button.onPressed, isNull);
    expect(
      button.style?.backgroundColor?.resolve(disabledStates),
      DalmColors.surfaceMuted,
    );
    expect(
      button.style?.foregroundColor?.resolve(disabledStates),
      DalmColors.textDisabled,
    );
  });

  testWidgets('각 variant가 의미 기반 색상 토큰을 사용한다', (tester) async {
    const variants = <DalmButtonVariant, (Color, Color)>{
      DalmButtonVariant.primary: (
        DalmColors.primaryAction,
        DalmColors.textInverse,
      ),
      DalmButtonVariant.accent: (
        DalmColors.accentAction,
        DalmColors.textPrimary,
      ),
      DalmButtonVariant.secondary: (DalmColors.surface, DalmColors.textPrimary),
      DalmButtonVariant.destructive: (
        DalmColors.destructive,
        DalmColors.textInverse,
      ),
    };

    for (final entry in variants.entries) {
      await pumpButton(
        tester,
        button: DalmButton(
          label: entry.key.name,
          onPressed: () {},
          variant: entry.key,
        ),
      );

      final button = tester.widget<FilledButton>(find.byType(FilledButton));

      expect(button.style?.backgroundColor?.resolve({}), entry.value.$1);
      expect(button.style?.foregroundColor?.resolve({}), entry.value.$2);
    }
  });
}
