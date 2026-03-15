enum BaseStatus { initial, loading, success, failure }

abstract class BaseState {
  const BaseState({this.status = BaseStatus.initial, this.errorMessage});

  final BaseStatus status;
  final String? errorMessage;
}

extension BaseStateCopyWith on BaseState {
  bool get isLoading => status == BaseStatus.loading;

  bool get hasError =>
      errorMessage != null &&
      errorMessage!.isNotEmpty &&
      status == BaseStatus.failure;

  bool get isSuccess => status == BaseStatus.success;

  bool get isInitial => status == BaseStatus.initial;

  bool get isFailure => status == BaseStatus.failure;
}
