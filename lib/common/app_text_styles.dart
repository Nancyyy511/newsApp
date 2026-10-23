import 'package:flutter/material.dart';
import 'package:news_app/common/theme/app_colors.dart';

class AppTextStyles {
  // Theme Colors
  static Color _getColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? AppColors.primaryWhiteColor
        : AppColors.primaryBlackColor;
  }

  // W400
  static TextStyle get styleW400S14 => _styleW400S14;
  static TextStyle get styleW400S16 => _styleW400S16;
  static TextStyle get styleW400S18 => _styleW400S18;
  static TextStyle get styleW400S20 => _styleW400S20;
  static TextStyle get styleW400S22 => _styleW400S22;

  static const TextStyle _styleW400S14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle _styleW400S16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle _styleW400S18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle _styleW400S20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle _styleW400S22 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );

  // W600
  static TextStyle get styleW600S14 => _styleW600S14;
  static TextStyle get styleW600S16 => _styleW600S16;
  static TextStyle get styleW600S18 => _styleW600S18;
  static TextStyle get styleW600S20 => _styleW600S20;
  static TextStyle get styleW600S22 => _styleW600S22;
  static TextStyle get styleW600S24 => _styleW600S24;

  static const TextStyle _styleW600S14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle _styleW600S16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle _styleW600S18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle _styleW600S20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle _styleW600S22 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle _styleW600S24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  // W700
  static TextStyle get styleW700S14 => _styleW700S14;
  static TextStyle get styleW700S16 => _styleW700S16;
  static TextStyle get styleW700S18 => _styleW700S18;
  static TextStyle get styleW700S20 => _styleW700S20;
  static TextStyle get styleW700S22 => _styleW700S22;

  static const TextStyle _styleW700S14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle _styleW700S16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle _styleW700S18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle _styleW700S20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle _styleW700S22 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  // W500
  static TextStyle get styleW500S14 => _styleW500S14;
  static TextStyle get styleW500S16 => _styleW500S16;
  static TextStyle get styleW500S18 => _styleW500S18;
  static TextStyle get styleW500S20 => _styleW500S20;
  static TextStyle get styleW500S22 => _styleW500S22;

  static const TextStyle _styleW500S14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle _styleW500S16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle _styleW500S18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle _styleW500S20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle _styleW500S22 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  // Get style according to current theme
  static TextStyle getW400S14(BuildContext context) =>
      _styleW400S14.copyWith(color: _getColor(context));

  static TextStyle getW400S16(BuildContext context) =>
      _styleW400S16.copyWith(color: _getColor(context));

  static TextStyle getW400S18(BuildContext context) =>
      _styleW400S18.copyWith(color: _getColor(context));

  static TextStyle getW400S20(BuildContext context) =>
      _styleW400S20.copyWith(color: _getColor(context));

  static TextStyle getW400S22(BuildContext context) =>
      _styleW400S22.copyWith(color: _getColor(context));

  static TextStyle getW600S14(BuildContext context) =>
      _styleW600S14.copyWith(color: _getColor(context));

  static TextStyle getW600S16(BuildContext context) =>
      _styleW600S16.copyWith(color: _getColor(context));

  static TextStyle getW600S18(BuildContext context) =>
      _styleW600S18.copyWith(color: _getColor(context));

  static TextStyle getW600S20(BuildContext context) =>
      _styleW600S20.copyWith(color: _getColor(context));

  static TextStyle getW600S22(BuildContext context) =>
      _styleW600S22.copyWith(color: _getColor(context));

  static TextStyle getW600S24(BuildContext context) =>
      _styleW600S24.copyWith(color: _getColor(context));

  static TextStyle getW700S14(BuildContext context) =>
      _styleW700S14.copyWith(color: _getColor(context));

  static TextStyle getW700S16(BuildContext context) =>
      _styleW700S16.copyWith(color: _getColor(context));

  static TextStyle getW700S18(BuildContext context) =>
      _styleW700S18.copyWith(color: _getColor(context));

  static TextStyle getW700S20(BuildContext context) =>
      _styleW700S20.copyWith(color: _getColor(context));

  static TextStyle getW700S22(BuildContext context) =>
      _styleW700S22.copyWith(color: _getColor(context));

  static TextStyle getW500S14(BuildContext context) =>
      _styleW500S14.copyWith(color: _getColor(context));

  static TextStyle getW500S16(BuildContext context) =>
      _styleW500S16.copyWith(color: _getColor(context));

  static TextStyle getW500S18(BuildContext context) =>
      _styleW500S18.copyWith(color: _getColor(context));

  static TextStyle getW500S20(BuildContext context) =>
      _styleW500S20.copyWith(color: _getColor(context));

  static TextStyle getW500S22(BuildContext context) =>
      _styleW500S22.copyWith(color: _getColor(context));
}
