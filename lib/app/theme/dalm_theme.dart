import 'package:flutter/material.dart';

import 'dalm_colors.dart';
import 'dalm_typography.dart';

abstract final class DalmTheme {
  static ThemeData get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: DalmColors.secondaryAction,
      brightness: Brightness.light,
      surface: DalmColors.surface,
      error: DalmColors.destructive,
    );

    return ThemeData(
      useMaterial3: true,
      fontFamily: DalmTypography.inter,
      scaffoldBackgroundColor: DalmColors.background,
      colorScheme: colorScheme,
      dividerColor: DalmColors.border,
      textTheme:
          const TextTheme(
            headlineMedium: DalmTypography.serifDisplay,
            headlineSmall: DalmTypography.serifHeadline,
            titleMedium: DalmTypography.title,
            bodyMedium: DalmTypography.body,
            labelLarge: DalmTypography.button,
            bodySmall: DalmTypography.caption,
          ).apply(
            bodyColor: DalmColors.textPrimary,
            displayColor: DalmColors.textPrimary,
          ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          backgroundColor: DalmColors.primaryAction,
          foregroundColor: DalmColors.textInverse,
          textStyle: DalmTypography.button,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
    );
  }
}
