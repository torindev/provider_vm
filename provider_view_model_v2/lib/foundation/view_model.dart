import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

export 'package:provider_view_model_v2/foundation/states/base_state.dart';
export 'package:provider_view_model_v2/foundation/states/content_state.dart';
export 'package:provider_view_model_v2/foundation/states/error_state.dart';
export 'package:provider_view_model_v2/foundation/states/loading_state.dart';
export 'package:provider_view_model_v2/utils/states_ext.dart';

abstract class ViewModel<T> extends ChangeNotifier {
  static T get<T>(BuildContext context) =>
      Provider.of<T>(context, listen: false);
}
