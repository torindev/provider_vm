import 'package:provider_view_model_v2/foundation/states/base_state.dart';

class ErrorState extends BaseState {
  final dynamic error;

  ErrorState({
    this.error,
  });
}
