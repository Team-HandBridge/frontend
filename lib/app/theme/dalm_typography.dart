import 'package:flutter/material.dart';

/// 감성 문구는 Noto Serif KR, 일반 UI는 Inter를 사용합니다.
abstract final class DalmTypography {
  static const inter = 'Inter';
  static const notoSerifKr = 'NotoSerifKR';

  static const serifDisplay = TextStyle(
    fontFamily: notoSerifKr,
    fontSize: 26,
    height: 1.44,
    fontWeight: FontWeight.w400,
  );
  static const serifHeadline = TextStyle(
    fontFamily: notoSerifKr,
    fontSize: 20,
    height: 1.44,
    fontWeight: FontWeight.w400,
  );
  static const serifBody = TextStyle(
    fontFamily: notoSerifKr,
    fontSize: 16,
    height: 1.44,
    fontWeight: FontWeight.w400,
  );
  static const title = TextStyle(
    fontFamily: inter,
    fontSize: 16,
    height: 1.2,
    fontWeight: FontWeight.w700,
  );
  static const button = TextStyle(
    fontFamily: inter,
    fontSize: 15,
    height: 1.2,
    fontWeight: FontWeight.w700,
  );
  static const body = TextStyle(
    fontFamily: inter,
    fontSize: 14,
    height: 1.4,
    fontWeight: FontWeight.w400,
  );
  static const bodyBold = TextStyle(
    fontFamily: inter,
    fontSize: 14,
    height: 1.4,
    fontWeight: FontWeight.w700,
  );
  static const caption = TextStyle(
    fontFamily: inter,
    fontSize: 12,
    height: 1.4,
    fontWeight: FontWeight.w400,
  );
}
