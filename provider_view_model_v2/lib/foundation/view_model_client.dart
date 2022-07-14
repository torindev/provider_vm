import 'package:flutter/material.dart';
import 'package:provider_view_model_v2/foundation/view_model.dart';

export 'package:provider_view_model_v2/foundation/states/base_state.dart';
export 'package:provider_view_model_v2/foundation/states/content_state.dart';
export 'package:provider_view_model_v2/foundation/states/error_state.dart';
export 'package:provider_view_model_v2/foundation/states/loading_state.dart';
export 'package:provider_view_model_v2/utils/states_ext.dart';

mixin ViewModelClient<T extends ViewModel> {
  T getViewModel(BuildContext context) => ViewModel.get(context);
}
