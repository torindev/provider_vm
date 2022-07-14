import 'package:get_it/get_it.dart';
import 'package:provider_view_model_v2/app_session.dart';

final getIt = GetIt.instance;

void setupGetItDependencies() {
  getIt.registerSingleton<AppSession>(AppSession());
}
