import 'package:new_bloc_template/di/injector.dart';

class AppConfig {
  AppConfig._();
  static final AppConfig instance = AppConfig._();

  Future<void> init() async {
    await initInjector();
  }
}
