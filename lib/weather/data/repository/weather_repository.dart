import 'package:weatherworkshop/weather/domain/models/geocode_model.dart';
import 'package:weatherworkshop/weather/domain/models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getWeather(num lat, num lon);
  Future<GeocodeModel> getLocation(String cityName);
}
