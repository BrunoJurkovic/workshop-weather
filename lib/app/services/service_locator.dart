import 'package:get_it/get_it.dart';
import 'package:weatherworkshop/app/network/dio.dart';
import 'package:weatherworkshop/app/routing/router.dart';
import 'package:weatherworkshop/weather/data/repository/weather_repository.dart';
import 'package:weatherworkshop/weather/data/source/weather_source.dart';
import 'package:weatherworkshop/weather/domain/repository/weather_repository.dart';
import 'package:weatherworkshop/weather/presentation/bloc/weather_bloc.dart';

final sl = GetIt.instance;
bool isDependencyInitialized = false;

Future<void> initDependencies() async {
  if (isDependencyInitialized) {
    return;
  }

  isDependencyInitialized = true;
  sl.registerLazySingleton(
    WeatherDio.new,
  );
  _initRouting();
}

void _initRouting() {
  sl.registerLazySingleton(AppRouter.new);
}

void initWeather() {
  sl
    ..registerLazySingleton(
      () => WeatherSource(
        sl(),
      ),
    )
    ..registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(
        source: sl(),
      ),
    )
    ..registerLazySingleton(
      () => WeatherBloc(
        repository: sl(),
      ),
    );
}
