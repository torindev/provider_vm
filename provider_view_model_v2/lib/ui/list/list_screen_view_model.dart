import 'package:flutter/material.dart';
import 'package:provider_view_model_v2/foundation/view_model.dart';

class ListScreenViewModel extends ViewModel {
  static ListScreenViewModel of(BuildContext context) => ViewModel.get(context);

  final List<int> _items = List.generate(200, (index) => index + 1);
  List<int> get items => [..._items];

  int? _updatedIndex;
  int? get updatedIndex => _updatedIndex;

  BaseState _itemsState = ContentState();
  BaseState get itemsState => _itemsState;

  void increaseItemValue(int index) {
    _items[index] = _items[index] + 1;
    _updatedIndex = index;
    _itemsState = ContentState();
    notifyListeners();
  }

  void decreaseItemValue(int index) {
    _items[index] = _items[index] - 1;
    _updatedIndex = index;
    _itemsState = ContentState();
    notifyListeners();
  }
}
