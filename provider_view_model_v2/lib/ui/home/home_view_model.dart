import 'package:flutter/material.dart';
import 'package:provider_view_model_v2/foundation/states/base_state.dart';
import 'package:provider_view_model_v2/foundation/states/content_state.dart';
import 'package:provider_view_model_v2/foundation/states/error_state.dart';
import 'package:provider_view_model_v2/foundation/states/loading_state.dart';
import 'package:provider_view_model_v2/foundation/view_model.dart';

class HomeViewModel extends ViewModel {
  static HomeViewModel of(BuildContext context) => ViewModel.get(context);

  BaseState _firstState = ContentState();
  BaseState get firstState => _firstState;

  BaseState _secondState = ContentState();
  BaseState get secondState => _secondState;

  BaseState _thirdState = ContentState();
  BaseState get thirdState => _thirdState;

  BaseState _getNextState(BaseState state) {
    BaseState newState;
    if (state is ContentState) {
      newState = const LoadingState();
    } else if (state is LoadingState) {
      newState = const ErrorState(error: 'Some error');
    } else {
      newState = const ContentState();
    }
    return newState;
  }

  BaseState _getPrevState(BaseState state) {
    BaseState newState;
    if (state is ContentState) {
      newState = const ErrorState(error: 'Some error');
    } else if (state is ErrorState) {
      newState = const LoadingState();
    } else {
      newState = const ContentState();
    }
    return newState;
  }

  void moveForwardFirstState() {
    _firstState = _getNextState(_firstState);
    notifyListeners();
  }

  void moveBackwardFirstState() {
    _firstState = _getPrevState(_firstState);
    notifyListeners();
  }

  void moveForwardSecondState() {
    _secondState = _getNextState(_secondState);
    notifyListeners();
  }

  void moveBackwardSecondState() {
    _secondState = _getPrevState(_secondState);
    notifyListeners();
  }

  void moveForwardThirdState() {
    _thirdState = _getNextState(_thirdState);
    notifyListeners();
  }

  void moveBackwardThirdState() {
    _thirdState = _getPrevState(_thirdState);
    notifyListeners();
  }
}
