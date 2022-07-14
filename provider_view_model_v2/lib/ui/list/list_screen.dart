import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_view_model_v2/foundation/states/base_state.dart';
import 'package:provider_view_model_v2/ui/list/list_screen_view_model.dart';

class ListScreen extends StatelessWidget {
  static const routeName = '/list-screen';

  static Future<Object?> startScreen(BuildContext context) =>
      Navigator.of(context).pushNamed<Object?>(routeName);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ListScreenViewModel(),
      child: _Layout(),
    );
  }
}

class _Layout extends StatelessWidget {
  const _Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List screen'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Selector<ListScreenViewModel, BaseState>(
            builder: (ctx, state, _) {
              print('build item with index $index');
              return ListTile(
                leading: IconButton(
                  onPressed: () =>
                      ListScreenViewModel.of(context).decreaseItemValue(index),
                  icon: const Icon(Icons.arrow_back),
                ),
                trailing: IconButton(
                  onPressed: () =>
                      ListScreenViewModel.of(context).increaseItemValue(index),
                  icon: const Icon(Icons.arrow_forward),
                ),
                title: Center(
                  child: Text(
                      'Value: ${ListScreenViewModel.of(context).items[index]}'),
                ),
                subtitle: Center(
                  child: Text('Index: $index'),
                ),
              );
            },
            selector: (ctx, vm) => vm.itemsState,
            shouldRebuild: (_, __) =>
                ListScreenViewModel.of(context).updatedIndex == index,
          );
        },
        itemCount: ListScreenViewModel.of(context).items.length,
      ),
    );
  }
}
