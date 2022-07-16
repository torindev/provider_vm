import 'package:provider_view_model_v2/foundation/states/base_state.dart';
import 'package:provider_view_model_v2/foundation/states/content_state.dart';
import 'package:provider_view_model_v2/foundation/states/loading_state.dart';

void main() {
  BaseState contentState1 = ContentState();
  BaseState contentState2 = ContentState();
  BaseState contentState3 = ContentState();
  BaseState contentState4 = ContentState();
  BaseState loadingState1 = LoadingState();
  print('contentState1 == contentState2 -> ${contentState1 == contentState2}');
  print('contentState2 == contentState3 -> ${contentState2 == contentState3}');
  print('contentState3 == contentState4 -> ${contentState3 == contentState4}');
  print('loadingState1 == contentState1 -> ${loadingState1 == contentState1}');
}
