import 'package:flutter/material.dart';

/// Text styles extracted from the Figma "PARALLEL" file.
///
/// Colors are intentionally not fixed so each screen can apply the appropriate
/// color for its background. Register the Inter and Noto Serif KR font files in
/// `pubspec.yaml` before using these styles in the app.
abstract final class DalmTypography {
  static const String interFontFamily = 'Inter';
  static const String notoSerifKrFontFamily = 'NotoSerifKR';

  // Noto Serif KR: emotional headlines and copy
  static const TextStyle serifDisplay = TextStyle(
    fontFamily: notoSerifKrFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 26,
    height: 37.4 / 26,
  );

  static const TextStyle serifHeadline1 = TextStyle(
    fontFamily: notoSerifKrFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 23,
    height: 33.1 / 23,
  );

  static const TextStyle serifHeadline2 = TextStyle(
    fontFamily: notoSerifKrFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 20,
    height: 28.7 / 20,
  );

  static const TextStyle serifBody = TextStyle(
    fontFamily: notoSerifKrFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 23 / 16,
  );

  static const TextStyle serifCaption = TextStyle(
    fontFamily: notoSerifKrFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 17.2 / 12,
  );

  // Inter: UI text
  static const TextStyle title1Bold = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 19.4 / 16,
  );

  static const TextStyle buttonBold = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 15,
    height: 18.2 / 15,
  );

  static const TextStyle body1Bold = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 16.9 / 14,
  );

  static const TextStyle body1Regular = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 13,
    height: 15.7 / 13,
  );

  static const TextStyle body2Bold = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 13,
    height: 15.7 / 13,
  );

  static const TextStyle body2Regular = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 14.5 / 12,
  );

  static const TextStyle caption1Bold = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 12,
    height: 14.5 / 12,
  );

  static const TextStyle caption1Regular = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 11,
    height: 13.3 / 11,
  );

  static const TextStyle caption2Bold = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 11,
    height: 13.3 / 11,
  );

  static const TextStyle caption2Regular = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 10,
    height: 12.1 / 10,
  );

  static const TextStyle caption3Bold = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 10,
    height: 12.1 / 10,
  );

  static const TextStyle caption3Regular = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 9,
    height: 10.9 / 9,
  );

  static const TextStyle caption4Bold = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 9,
    height: 10.9 / 9,
  );

  static const TextStyle caption4Regular = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 8,
    height: 9.7 / 8,
  );

  static const TextStyle microBold = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 8,
    height: 9.7 / 8,
  );
}
