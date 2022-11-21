// ignore_for_file: lines_longer_than_80_chars

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weatherworkshop/weather/data/repository/weather_repository.dart';
import 'package:weatherworkshop/weather/domain/models/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';
part 'weather_bloc.freezed.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({required WeatherRepository repository})
      : _repository = repository,
        super(const WeatherState.initial()) {
    on<WeatherEvent>(
      (event, emit) async {
        await event.when(
          fetch: (city) async {
            try {
              /// Emitting loading state to the bloc.
              emit(const WeatherState.loading());

              /// Calling the `getLocation` method from the `WeatherRepository` class.
              final geocode = await _repository.getLocation(city);

              /// Calling the `getWeather` method from the `WeatherRepository` class with the coordinates.
              final weather = await _repository.getWeather(
                geocode.lat,
                geocode.lon,
              );
              emit(WeatherState.loaded(weather, city));
            } catch (e) {
              emit(const WeatherState.error());
            }
          },
        );
      },
    );
  }

  final WeatherRepository _repository;
}
