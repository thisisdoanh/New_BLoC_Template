import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_bloc_template/core/base_component/base_state.dart';

part 'splash_state.freezed.dart';

@freezed
abstract class SplashState extends BaseState with _$SplashState {
  const factory SplashState({
    @Default(BaseStatus.initial) BaseStatus status,
    @Default(false) bool isLogin,
    String? errorMessage,
  }) = _SplashState;

  const SplashState._({super.status = BaseStatus.initial, super.errorMessage});
}
