import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import  'package:new_bloc_template/di/injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> initInjector() async => getIt.init();
