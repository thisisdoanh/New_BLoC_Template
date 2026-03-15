part of '../light_theme.dart';

class MySwitchTheme extends SwitchThemeData {
  MySwitchTheme()
    : super(
        trackOutlineWidth: const WidgetStatePropertyAll(2),
        thumbColor: WidgetStateProperty.all<Color>(Colors.white),
        trackOutlineColor: WidgetStateProperty.all(Colors.white),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return Colors.white;
        }),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );
}
