import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_view_model_v2/foundation/view_model_client.dart';
import 'package:provider_view_model_v2/ui/list/list_screen_view_model.dart';

class ListScreen extends StatelessWidget {
  static const routeName = '/list-screen';

  const ListScreen({Key? key}) : super(key: key);

  static Future<Object?> startScreen(BuildContext context) =>
      Navigator.of(context).pushNamed<Object?>(routeName);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ListScreenViewModel(),
      child: const _Layout(),
    );
  }
}

class _Layout extends StatelessWidget
    with ViewModelClient<ListScreenViewModel> {
  const _Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List screen'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Selector<ListScreenViewModel, BaseState>(
            builder: (ctx, state, _) {
              return ListTile(
                leading: IconButton(
                  onPressed: () =>
                      getViewModel(context).decreaseItemValue(index),
                  icon: const Icon(Icons.arrow_back),
                ),
                trailing: IconButton(
                  onPressed: () =>
                      getViewModel(context).increaseItemValue(index),
                  icon: const Icon(Icons.arrow_forward),
                ),
                title: Center(
                  child: Text('Value: ${getViewModel(context).items[index]}'),
                ),
                subtitle: Center(
                  child: Text('Index: $index'),
                ),
              );
            },
            selector: (ctx, vm) => vm.itemsState,
            shouldRebuild: (_, __) =>
                getViewModel(context).updatedIndex == index,
          );
        },
        itemCount: getViewModel(context).items.length,
      ),
    );
  }
}
