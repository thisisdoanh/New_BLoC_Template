import 'package:new_bloc_template/core/base_component/base_cubit.dart';
import 'package:new_bloc_template/presentation/splash/cubit/splash_state.dart';

class SplashCubit extends BaseCubit<SplashState> {
  SplashCubit() : super(const SplashState());

  @override
  Future<void> load() async {}
}
