part of '../light_theme.dart';

class MyFilledButtonTheme extends FilledButtonThemeData {
  @override
  ButtonStyle? get style => FilledButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100).r),
    textStyle: AppTextStyles.style.s16.w600.white.h19,
    padding: EdgeInsets.symmetric(vertical: 15.5.h, horizontal: 20.w),
    visualDensity: VisualDensity.standard,
    backgroundColor: AppColors.primaryDefault,
    minimumSize: Size.zero,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    iconSize: 24.r,
  );
}
