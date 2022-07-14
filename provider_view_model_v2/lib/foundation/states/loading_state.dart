import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider_view_model_v2/foundation/states/base_state.dart';

class LoadingState extends BaseState {
  const LoadingState({super.id});

  factory LoadingState.update() => LoadingState(
        id: DateTime.now().microsecondsSinceEpoch,
      );
}
