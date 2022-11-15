import 'package:get_it/get_it.dart';
import 'package:weatherworkshop/app/routing/router.dart';

final sl = GetIt.instance;
bool isDependencyInitialized = false;

Future<void> initDependencies() async {
  if (isDependencyInitialized) {
    return;
  }

  isDependencyInitialized = true;
  _initRouting();
}

void _initRouting() {
  sl.registerLazySingleton(AppRouter.new);
}
