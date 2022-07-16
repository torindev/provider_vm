import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_view_model_v2/domain/use_cases/user_store.dart';
import 'package:provider_view_model_v2/foundation/view_model_client.dart';
import 'package:provider_view_model_v2/ui/home/home_view_model.dart';
import 'package:provider_view_model_v2/ui/home/widgets/counter_label.dart';
import 'package:provider_view_model_v2/ui/list/list_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (ctx) => HomeViewModel(),
      child: const _Layout(),
    );
  }
}

class _Layout extends StatelessWidget with ViewModelClient<HomeViewModel> {
  const _Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = HomeViewModel.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Model Test Drive V2'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => ListScreen.startScreen(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('List screen'),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Selector<HomeViewModel, BaseState>(
                selector: (ctx, vm) => vm.firstValueState,
                builder: (ctx, state, _) {
                  return CounterLabel(
                    value: vm.firstValue,
                    isBusy: state.isLoadingState(),
                  );
                },
              ),
              TextButton(
                onPressed: () => vm.updateFirstValue(),
                child: const Text('update ViewModel first value'),
              ),
              const SizedBox(height: 24),
              Selector<HomeViewModel, BaseState>(
                selector: (ctx, vm) => vm.secondValueState,
                builder: (ctx, state, _) {
                  return CounterLabel(
                    value: vm.secondValue,
                    isBusy: state.isLoadingState(),
                  );
                },
              ),
              TextButton(
                onPressed: () => vm.updateSecondValue(),
                child: const Text('update ViewModel second value'),
              ),
              const SizedBox(height: 24),
              Selector<UserStore, BaseState>(
                selector: (ctx, userStore) => userStore.valueState,
                builder: (ctx, state, _) {
                  return CounterLabel(
                    value: UserStore.getInstance().value,
                    isBusy: state.isLoadingState(),
                  );
                },
              ),
              TextButton(
                onPressed: () => UserStore.getInstance().updateValue(),
                child: const Text('update UserStore value'),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
