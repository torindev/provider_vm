import 'package:flutter/material.dart';
import 'package:provider_view_model_v2/foundation/states/base_state.dart';
import 'package:provider_view_model_v2/foundation/states/content_state.dart';
import 'package:provider_view_model_v2/foundation/states/loading_state.dart';
import 'package:provider_view_model_v2/setup/get_it_deps.dart';

class UserStore extends ChangeNotifier {
  static UserStore getInstance() => getIt<UserStore>();

  BaseState _valueState = ContentState();
  BaseState get valueState => _valueState;

  int _value = 0;
  int get value => _value;

  Future<void> updateValue() async {
    _valueState = LoadingState();
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));

    _value++;
    _valueState = ContentState();
    notifyListeners();
  }
}
