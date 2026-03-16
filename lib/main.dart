import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:new_bloc_template/app/app.dart';
import 'package:new_bloc_template/core/config/app_config.dart';
import 'package:new_bloc_template/core/utils/log_utils.dart';
import 'package:new_bloc_template/flavors.dart';

void main() {
  F.appFlavor = Flavor.values.firstWhere((element) => element.name == appFlavor);

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await AppConfig.instance.init();
      runApp(const App());
    },
    (error, stack) {
      LogUtils.logE(message: 'Error: $error\n$stack');
    },
  );
}
