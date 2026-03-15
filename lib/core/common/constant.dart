import 'package:flutter_screenutil/flutter_screenutil.dart';

final double kRadiusButton = 12.0.r;
final double kRadiusTextField = 8.0.r;

class Constant {
  static final RegExp passwordRegexp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*()<>?~_+|=;:]).{8,}$');
  static final RegExp passwordAtLeast8Char = RegExp(r'^.{8,}$');
  static final RegExp passwordContainsAtLeast1UppercaseLetterAndNumber =
      RegExp(r'^(?=.*[A-Z])(?=.*\d).+$');
  static final RegExp passwordASpecialCharacter = RegExp(r'^(?=.*[~#@$%&!*_?^\-]).+$');
  static final RegExp emailRegexp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  static final RegExp phoneRegexp = RegExp(r'^0[0-9]{9}$');
}

class Pagination {
  static const int firstPage = 1;
  static const int jiraListIssuePageSize = 20;
}
