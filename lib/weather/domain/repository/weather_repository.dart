// ignore_for_file: lines_longer_than_80_chars, avoid_dynamic_calls

import 'dart:convert';

import 'package:loggy/loggy.dart';
import 'package:weatherworkshop/weather/data/repository/weather_repository.dart';
import 'package:weatherworkshop/weather/data/source/weather_source.dart';
import 'package:weatherworkshop/weather/domain/models/geocode_model.dart';
import 'package:weatherworkshop/weather/domain/models/weather_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  const WeatherRepositoryImpl({required WeatherSource source})
      : _source = source;

  /// It takes a city name as a parameter and returns a GeocodeModel object.
  ///
  /// Args:
  ///   cityName (String): The name of the city you want to get the coordinates for.
  @override
  Future<GeocodeModel> getLocation(String cityName) async {
    try {
      /// Calling the `getLocation` method from the `WeatherSource` class.
      final rawResponse = await _source.getLocation(cityName);

      /// Decoding the raw response from the API into a list of maps.
      final json = jsonDecode(rawResponse) as List;

      /// Getting the first element of the list and casting it to a map.
      final jsonLocation = json.first as Map<String, dynamic>;

      /// Converting the map into a `GeocodeModel` object.
      final result = GeocodeModel.fromJson(jsonLocation);
      return result;
    } catch (e) {
      logError(e);
      rethrow;
    }
  }

  /// > It calls the `getWeather` function of the `WeatherSource` service, which returns a `Future<String>`
  /// object.
  ///
  /// The `Future<String>` object is then decoded into a `Map<String, dynamic>` object, which is then used
  /// to create a `WeatherModel` object.
  ///
  /// The `WeatherModel` object is then returned.
  ///
  /// Args:
  ///   lat (num): latitude
  ///   lon (num): longitude
  ///
  /// Returns:
  ///   A Future<WeatherModel>
  @override
  Future<WeatherModel> getWeather(num lat, num lon) async {
    try {
      /// Calling the `getWeather` function of the `WeatherSource` service, which returns a
      /// `Future<String>`
      /// object.
      final rawResponse = await _source.getWeather(lat, lon);

      /// Decoding the raw response from the API into a map.
      final json = jsonDecode(rawResponse) as Map<String, dynamic>;

      /// Getting the `main` key from the `json` map.
      final weatherData = json['main'] as Map<String, dynamic>;

      final currentCondition = json['weather'][0]['id'] as int;

      /// Converting the `weatherData` map into a `WeatherModel` object.
      final result = WeatherModel.fromJson(weatherData);
      return result.copyWith(condition: currentCondition);
    } catch (e) {
      logError(e);
      rethrow;
    }
  }

  final WeatherSource _source;
}
