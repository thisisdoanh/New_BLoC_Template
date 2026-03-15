part of '../light_theme.dart';

class MyDialogTheme extends DialogThemeData {
  @override
  Color? get surfaceTintColor => Colors.white;

  @override
  ShapeBorder? get shape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20).r);

  @override
  EdgeInsets? get insetPadding => EdgeInsets.symmetric(horizontal: 20.w);

  @override
  Color? get barrierColor => Colors.black.withValues(alpha: .68);
}
