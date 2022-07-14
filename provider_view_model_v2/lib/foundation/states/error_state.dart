import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider_view_model_v2/foundation/states/base_state.dart';

class ErrorState extends BaseState {
  final dynamic error;

  const ErrorState({
    super.id,
    this.error,
  });

  factory ErrorState.update({dynamic error}) => ErrorState(
        id: DateTime.now().microsecondsSinceEpoch,
        error: error,
      );
}
