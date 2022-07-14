import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_view_model_v2/app_session.dart';

class MultiProviderApp extends StatelessWidget {
  final Widget child;

  const MultiProviderApp({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AppSession.getInstance(),
        )
      ],
      child: child,
    );
  }
}
