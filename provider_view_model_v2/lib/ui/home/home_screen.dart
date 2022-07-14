import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_view_model_v2/app_session.dart';
import 'package:provider_view_model_v2/foundation/view_model_client.dart';
import 'package:provider_view_model_v2/ui/home/widgets/buttons_row.dart';
import 'package:provider_view_model_v2/ui/home/home_view_model.dart';
import 'package:provider_view_model_v2/ui/list/list_screen.dart';
import 'package:tuple/tuple.dart';

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
    print('build in HOME layout');
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
              Selector<HomeViewModel, BaseState>(
                selector: (ctx, vm1) => vm1.firstState,
                builder: (ctx, state, _) {
                  print(
                      'build in FIRST selector (state = ${state.runtimeType})');
                  return ButtonsRow(
                    state: state,
                    onClickLeft: () => vm.moveBackwardFirstState(),
                    onClickRight: () => vm.moveForwardFirstState(),
                  );
                },
              ),
              const SizedBox(height: 12),
              Selector<HomeViewModel, BaseState>(
                selector: (ctx, vm1) => vm1.secondState,
                builder: (ctx, state, _) {
                  print(
                      'build in SECOND selector (state = ${state.runtimeType})');
                  return ButtonsRow(
                    state: state,
                    onClickLeft: () => vm.moveBackwardSecondState(),
                    onClickRight: () => vm.moveForwardSecondState(),
                  );
                },
              ),
              const SizedBox(height: 12),
              Selector<HomeViewModel, BaseState>(
                selector: (ctx, vm1) => vm1.thirdState,
                builder: (ctx, state, _) {
                  print(
                      'build in THIRD selector (state = ${state.runtimeType})');
                  return ButtonsRow(
                    state: state,
                    onClickLeft: () => vm.moveBackwardThirdState(),
                    onClickRight: () => vm.moveForwardThirdState(),
                  );
                },
              ),
              const SizedBox(height: 32),
              Selector<AppSession, Tuple3<BaseState, BaseState, BaseState>>(
                builder: (ctx, tuple3states, _) {
                  print('build in SESSION selector');
                  return Text(
                    AppSession.getInstance().counter.toString(),
                    style: const TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
                selector: (ctx, appSession) => Tuple3(
                  appSession.state1,
                  appSession.state2,
                  appSession.state3,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () =>
                        AppSession.getInstance().addCounterState1(),
                    child: const Text('+ s1'),
                  ),
                  TextButton(
                    onPressed: () =>
                        AppSession.getInstance().addCounterState2(),
                    child: const Text('+ s2'),
                  ),
                  TextButton(
                    onPressed: () =>
                        AppSession.getInstance().addCounterState3(),
                    child: const Text('+ s3'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () =>
                        AppSession.getInstance().reduceCounterState1(),
                    child: const Text('- s1'),
                  ),
                  TextButton(
                    onPressed: () =>
                        AppSession.getInstance().reduceCounterState2(),
                    child: const Text('- s2'),
                  ),
                  TextButton(
                    onPressed: () =>
                        AppSession.getInstance().reduceCounterState3(),
                    child: const Text('- s3'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
