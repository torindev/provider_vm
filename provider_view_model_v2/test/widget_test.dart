// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider_view_model_v2/foundation/states/base_state.dart';
import 'package:provider_view_model_v2/foundation/states/content_state.dart';
import 'package:provider_view_model_v2/foundation/states/error_state.dart';
import 'package:provider_view_model_v2/foundation/states/loading_state.dart';

import 'package:provider_view_model_v2/main.dart';

void main() {
  BaseState contentState1 = ContentState();
  BaseState contentState2 = ContentState();
  BaseState contentState3 = ContentState.update();
  BaseState contentState4 = ContentState.update();
  BaseState loadingState1 = LoadingState();
  print('contentState1 == contentState2 -> ${contentState1 == contentState2}');
  print('contentState2 == contentState3 -> ${contentState2 == contentState3}');
  print('contentState3 == contentState4 -> ${contentState3 == contentState4}');
  print('loadingState1 == contentState1 -> ${loadingState1 == contentState1}');
}
