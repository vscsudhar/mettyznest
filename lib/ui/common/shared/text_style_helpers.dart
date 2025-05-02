import 'package:flutter/material.dart';
import 'package:mettyznest/ui/common/shared/styles.dart';

extension TextStyleHelpers on TextStyle {
  TextStyle get size8 => copyWith(fontSize: 8 * scale);
  TextStyle get size10 => copyWith(fontSize: 10 * scale);
  TextStyle get size12 => copyWith(fontSize: 12 * scale);
  TextStyle get size14 => copyWith(fontSize: 14 * scale);
  TextStyle get size16 => copyWith(fontSize: 16 * scale);
  TextStyle get size18 => copyWith(fontSize: 18 * scale);
  TextStyle get size20 => copyWith(fontSize: 20 * scale);
  TextStyle get size22 => copyWith(fontSize: 22 * scale);
  TextStyle get size24 => copyWith(fontSize: 24 * scale);
  TextStyle get size26 => copyWith(fontSize: 26 * scale);
  TextStyle get size28 => copyWith(fontSize: 28 * scale);
  TextStyle get size30 => copyWith(fontSize: 30 * scale);
  TextStyle get size32 => copyWith(fontSize: 32 * scale);
  TextStyle get size34 => copyWith(fontSize: 34 * scale);

  TextStyle get color2699FB => copyWith(color: appcolorFF7612);
  TextStyle get appColor => copyWith(color: Colors.deepOrange.shade700);
  TextStyle get colororg => copyWith(color: appcolororenge);
  TextStyle get appwhite => copyWith(color: appwhite1);
  TextStyle get appViking1 => copyWith(color: appViking);
  TextStyle get appBrinkPink1 => copyWith(color: appBrinkPink);
  TextStyle get appChambray1 => copyWith(color: appChambray);
  TextStyle get white70 => copyWith(color: Colors.white70);
  TextStyle get white54 => copyWith(color: Colors.white54);
  TextStyle get red => copyWith(color: Colors.red);
  TextStyle get black => copyWith(color: Colors.black);
  TextStyle get black45 => copyWith(color: Colors.black45);
  TextStyle get disableColor => copyWith(color: const Color(0xFFEEEEEE));
  TextStyle get ceon =>
      copyWith(color: const Color.fromARGB(255, 18, 136, 126));
}
