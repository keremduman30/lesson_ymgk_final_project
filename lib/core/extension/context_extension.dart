import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowValue => height * 0.01;
  double get lowValuePlus => height * 0.015;
  double get normalValue => height * 0.02;
  double get normalPlus => height * 0.03;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;
  double get highPlus => height * 0.2;

  //kayit için ekstra
  double get loginLalue1 => width * 0.8;
  double get keyboardHeight => mediaQuery.viewInsets.bottom;
}

extension MediaquerySize on BuildContext {
  double dymaicHeight(double value) => mediaQuery.size.height * value;
  double dymaicWidth(double value) => mediaQuery.size.width * value;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textThem => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

//paddingler vermek için
extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingLowPlus => EdgeInsets.all(lowValuePlus);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingNormalPlus => EdgeInsets.all(normalPlus);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
  EdgeInsets get paddingHighPlus => EdgeInsets.all(highPlus);
}

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingLowVerticalPlus => EdgeInsets.symmetric(vertical: lowValuePlus);
  EdgeInsets get paddingNormalVertical => EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingMediumVertical => EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingHighVertical => EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingLowHorizontal => EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingNormalHorizontal => EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingMediumHorizontal => EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingHighHorizontal => EdgeInsets.symmetric(horizontal: highValue);
}

extension PageExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension DurationExtension on BuildContext {
  Duration get lowDuration => const Duration(milliseconds: 500);
  Duration get normalDuration => const Duration(seconds: 1);
}

extension PageColorExtension on BuildContext {
  Color get randomPageColor => Colors.primaries[Random().nextInt(17)];
}

extension TextColorStyle on BuildContext {
  TextStyle get textBlackColor => textThem.titleLarge!.copyWith(color: colors.onSecondary);
}
