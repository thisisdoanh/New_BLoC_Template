part of '../light_theme.dart';

class MyIconButtonTheme extends IconButtonThemeData {
  @override
  ButtonStyle? get style => IconButton.styleFrom(
    iconSize: 24.r,
    padding: EdgeInsets.all(8.r),
    minimumSize: Size.zero,
    overlayColor: AppColors.primaryDefault,
    visualDensity: VisualDensity.standard,
  );
}
