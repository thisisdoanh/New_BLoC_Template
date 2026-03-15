part of '../light_theme.dart';

class MyOutlinedButtonTheme extends OutlinedButtonThemeData {
  @override
  ButtonStyle? get style => OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100).r),
    textStyle: TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryDefault,
      height: 1.28,
      fontFamily: FontFamily.manrope,
    ),
    padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
    visualDensity: VisualDensity.standard,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    iconSize: 24.r,
    side: BorderSide(color: AppColors.primaryDefault, width: 1.r),
  );
}
