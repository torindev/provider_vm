import 'package:flutter/material.dart';
import 'package:provider_view_model_v2/app.dart';
import 'package:provider_view_model_v2/setup/get_it_deps.dart';
import 'package:provider_view_model_v2/setup/multi_provider_app.dart';

void main() {
  setupGetItDependencies();
  runApp(
    const MultiProviderApp(
      child: App(),
    ),
  );
}
