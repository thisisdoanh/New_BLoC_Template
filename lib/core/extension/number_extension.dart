import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumberExtension on num {
  String get convertByte {
    if (this < 1024) {
      return '$this bytes'; // Nếu < 1 KB
    } else if (this < 1024 * 1024) {
      return '${this ~/ 1024} KB'; // Nếu < 1 MB
    } else if (this < 1024 * 1024 * 1024) {
      return '${this ~/ (1024 * 1024)} MB'; // Nếu >= 1 MB
    } else {
      return '${this ~/ (1024 * 1024 * 1024)} GB'; // Nếu >= 1 GB
    }
  }

  double get toResponsiveWidth {
    return this * (1.sw / 360);
  }

  double get toResponsiveHeight {
    return this * (1.sh / 640);
  }
}
