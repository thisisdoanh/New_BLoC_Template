import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';

class LogUtils {
  static void logE({String? message}) {
    if (kDebugMode && message != null) {
      logLong(message);
    }
  }

  static void logMessageObj({required dynamic obj, required String title}) {
    if (kDebugMode) {
      print('#CloudWallet: $title:');
      print(obj);
    }
  }

  static void logLong(String s, {int chunk = 800, String title = '1HubMobile'}) {
    try {
      for (var i = 0; i < s.length; i += chunk) {
        dev.log(s.substring(i, (i + chunk > s.length) ? s.length : i + chunk), name: title);
      }
    } catch (e) {
      dev.log('Error logging long message: ${e.toString()}', name: title);
    }
  }
}
