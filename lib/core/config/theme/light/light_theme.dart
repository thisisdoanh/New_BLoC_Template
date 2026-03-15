import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_bloc_template/core/config/colors.dart';
import 'package:new_bloc_template/gen/fonts.gen.dart';

part 'component_theme/dialog_theme.dart';

part 'component_theme/filled_button_theme.dart';

part 'component_theme/icon_button_theme.dart';

part 'component_theme/outlined_button_theme.dart';

part 'component_theme/switch_theme.dart';

part 'component_theme/text_button_theme.dart';

part 'component_theme/text_theme.dart';

part 'component_theme/check_box_theme.dart';

part 'component_theme/bottom_sheet_theme.dart';

ThemeData lightThemeData = ThemeData(
  colorScheme: const ColorScheme.light(primary: AppColors.primaryDefault),
  useMaterial3: true,
  textTheme: MyTextTheme(),
  scaffoldBackgroundColor: Colors.white,
  dialogTheme: MyDialogTheme(),
  filledButtonTheme: MyFilledButtonTheme(),
  iconButtonTheme: MyIconButtonTheme(),
  outlinedButtonTheme: MyOutlinedButtonTheme(),
  textButtonTheme: MyTextButtonTheme(),
  switchTheme: MySwitchTheme(),
  checkboxTheme: MyCheckboxTheme(),
  bottomSheetTheme: MyBottomSheetTheme(),
);
