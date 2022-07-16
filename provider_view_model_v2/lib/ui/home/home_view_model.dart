import 'package:flutter/material.dart';
import 'package:provider_view_model_v2/foundation/view_model.dart';

class HomeViewModel extends ViewModel {
  static HomeViewModel of(BuildContext context) => ViewModel.get(context);

  int _firstValue = 0;
  int get firstValue => _firstValue;

  int _secondValue = 0;
  int get secondValue => _secondValue;

  BaseState _firstValueState = ContentState();
  BaseState get firstValueState => _firstValueState;

  BaseState _secondValueState = ContentState();
  BaseState get secondValueState => _secondValueState;

  Future<void> updateFirstValue() async {
    if (_firstValueState.isLoadingState()) return;
    _firstValueState = LoadingState();
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    _firstValue++;
    _firstValueState = ContentState();
    notifyListeners();
  }

  Future<void> updateSecondValue() async {
    if (_secondValueState.isLoadingState()) return;
    _secondValueState = LoadingState();
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    _secondValue++;
    _secondValueState = ContentState();
    notifyListeners();
  }
}
