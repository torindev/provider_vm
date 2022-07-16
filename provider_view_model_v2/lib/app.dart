import 'package:flutter/material.dart';
import 'package:provider_view_model_v2/ui/home/home_screen.dart';
import 'package:provider_view_model_v2/ui/list/list_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      // initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (ctx) => const HomeScreen(),
        ListScreen.routeName: (ctx) => const ListScreen(),
      },
    );
  }
}
