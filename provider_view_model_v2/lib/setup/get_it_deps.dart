import 'package:get_it/get_it.dart';
import 'package:provider_view_model_v2/domain/use_cases/user_store.dart';

final getIt = GetIt.instance;

void setupGetItDependencies() {
  getIt.registerSingleton<UserStore>(UserStore());
}
