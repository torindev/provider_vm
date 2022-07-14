import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider_view_model_v2/foundation/states/base_state.dart';

class ContentState extends BaseState {
  const ContentState({super.id});

  factory ContentState.update() => ContentState(
        id: DateTime.now().microsecondsSinceEpoch,
      );
}
