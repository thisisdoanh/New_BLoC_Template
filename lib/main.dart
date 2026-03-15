import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:new_bloc_template/app.dart';
import 'package:new_bloc_template/flavors.dart';

void main() {
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );

  runApp(const App());
}
