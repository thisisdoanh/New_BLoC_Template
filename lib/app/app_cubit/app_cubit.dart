import 'package:injectable/injectable.dart';
import 'package:new_bloc_template/app/app_cubit/app_state.dart';
import 'package:new_bloc_template/core/base_component/base_cubit.dart';
import 'package:new_bloc_template/core/base_component/base_state.dart';

@singleton
class AppCubit extends BaseCubit<AppState> {
  AppCubit() : super(const AppState());

  @override
  Future<void> load() async {}

  void onSessionExpired() {
    emit(state.copyWith(status: BaseStatus.failure));
  }
}
