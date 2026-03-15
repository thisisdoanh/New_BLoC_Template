part of '../light_theme.dart';

class MyTextButtonTheme extends TextButtonThemeData {
  @override
  ButtonStyle? get style => TextButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100).r),
    textStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryDefault,
      height: 19 / 16,
      fontFamily: FontFamily.manrope,
    ),
    padding: EdgeInsets.symmetric(vertical: 15.5.h, horizontal: 20.w),
    visualDensity: VisualDensity.standard,
    minimumSize: Size.zero,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    iconColor: AppColors.primaryDefault,
    iconSize: 24.r,
  );
}
