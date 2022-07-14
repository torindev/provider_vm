import 'package:provider_view_model_v2/foundation/states/base_state.dart';
import 'package:provider_view_model_v2/foundation/states/content_state.dart';
import 'package:provider_view_model_v2/foundation/states/error_state.dart';
import 'package:provider_view_model_v2/foundation/states/loading_state.dart';

extension BaseStateEx on BaseState? {
  bool isLoadingOrError() {
    if (this == null) return false;
    return this is LoadingState || this is ErrorState;
  }

  bool isLoadingState() {
    if (this == null) return false;
    return this is LoadingState;
  }

  bool isErrorState() {
    if (this == null) return false;
    return this is ErrorState;
  }

  bool isContentState() {
    if (this == null) return false;
    return this is ContentState;
  }

  String? get errorMessage {
    if (this == null) return null;
    try {
      if (this is ErrorState) {
        return (this as ErrorState).error.toString();
      }
    } catch (ex) {
      return null;
    }
    return null;
  }
}
