part of '../light_theme.dart';

class MyCheckboxTheme extends CheckboxThemeData {
  @override
  BorderSide? get side => BorderSide(color: AppColors.primaryDefault, width: 1.r);

  @override
  OutlinedBorder? get shape => RoundedRectangleBorder(borderRadius: BorderRadius.circular(4).r);

  @override
  double? get splashRadius => 20.0;

  @override
  VisualDensity? get visualDensity => const VisualDensity(vertical: -4, horizontal: -4);

  @override
  MaterialTapTargetSize? get materialTapTargetSize => MaterialTapTargetSize.shrinkWrap;
}
