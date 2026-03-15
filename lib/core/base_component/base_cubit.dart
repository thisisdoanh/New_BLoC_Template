import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bloc_template/core/base_component/base_state.dart';

abstract class BaseCubit<T extends BaseState> extends Cubit<T> {
  BaseCubit(super.initialState);

  Future<void> load() async {}
}
