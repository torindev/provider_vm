import 'package:flutter/material.dart';
import 'package:provider_view_model_v2/foundation/states/base_state.dart';
import 'package:provider_view_model_v2/foundation/states/content_state.dart';
import 'package:provider_view_model_v2/setup/get_it_deps.dart';

class AppSession extends ChangeNotifier {
  static AppSession getInstance() => getIt<AppSession>();

  BaseState _state1 = const ContentState();
  BaseState get state1 => _state1;

  BaseState _state2 = const ContentState();
  BaseState get state2 => _state2;

  BaseState _state3 = const ContentState();
  BaseState get state3 => _state3;

  int _counter = 0;
  int get counter => _counter;

  void addCounterState1() {
    _state1 = ContentState.update();
    _counter++;
    notifyListeners();
  }

  void addCounterState2() {
    _state2 = ContentState.update();
    _counter++;
    notifyListeners();
  }

  void addCounterState3() {
    _state3 = ContentState.update();
    _counter++;
    notifyListeners();
  }

  void reduceCounterState1() {
    _state1 = ContentState.update();
    _counter--;
    notifyListeners();
  }

  void reduceCounterState2() {
    _state2 = ContentState.update();
    _counter--;
    notifyListeners();
  }

  void reduceCounterState3() {
    _state3 = ContentState.update();
    _counter--;
    notifyListeners();
  }
}
