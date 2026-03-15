part of '../light_theme.dart';

class MyBottomSheetTheme extends BottomSheetThemeData {
  @override
  ShapeBorder? get shape => RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: const Radius.circular(24).r,
      topRight: const Radius.circular(24).r,
    ),
  );

  @override
  Color? get modalBarrierColor => Colors.black.withValues(alpha: .68);
}
