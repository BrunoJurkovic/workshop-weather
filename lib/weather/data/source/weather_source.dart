import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_source.g.dart';

@RestApi()
abstract class WeatherSource {
  factory WeatherSource(Dio dio) = _WeatherSource;

  @GET('data/2.5/weather')
  Future<String> getWeather(
    @Query('lat') num lat,
    @Query('lon') num lon, [
    @Query('units') String units = 'metric',
    @Query('appid') String apiKey = '3da71e800856fb77e48ffabb094bcdd8',
  ]);

  @GET('geo/1.0/direct')
  Future<String> getLocation(
    @Query('q') String cityName, [
    @Query('appid') String apiKey = '3da71e800856fb77e48ffabb094bcdd8',
  ]);
}
