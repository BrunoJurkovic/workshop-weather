// ignore_for_file: lines_longer_than_80_chars, avoid_dynamic_calls, strict_raw_type

// 🎯 Dart imports:
import 'dart:convert';

// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:loggy/loggy.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// 🌎 Project imports:
import 'package:weatherworkshop/app/helper/exceptions.dart';

class WeatherDio {
  WeatherDio();
  Dio get dio {
    final dio = Dio();
    dio.options.baseUrl = 'https://api.openweathermap.org/';
    dio.options.connectTimeout = 7000; // 7s
    dio.options.receiveTimeout = 10000;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, handler) async {
          return handler.next(options);
        },
        onResponse: (Response response, handler) {
          return handler.next(response);
        },
        onError: (DioError error, handler) async {
          String? errorMessage;
          if (error.response == null) {
            return handler.next(
              NetworkSocketException(
                message: 'Network unavailable',
                type: DioErrorType.response,
                requestOptions: RequestOptions(path: ''),
                error: error,
              ),
            );
          } else if (error.response != null) {
            if (error.response!.data == null ||
                error.response!.data == '' ||
                error.response!.statusCode == null) {
              return handler.next(
                WeatherNoBodyException(
                  message: 'Something went wrong',
                  type: DioErrorType.response,
                  requestOptions: RequestOptions(path: ''),
                  error: error,
                ),
              );
            } else {
              try {
                if (error.response!.data is Map) {
                  if (error.response!.data['errors'] != null) {
                    errorMessage =
                        error.response!.data['errors'][0]['message'].toString();
                  }
                } else {
                  if (error.response!.data is String) {
                    if (jsonDecode(error.response!.data as String)['errors'] !=
                        null) {
                      errorMessage =
                          jsonDecode(error.response!.data as String)['errors']
                                  [0]['message']
                              .toString();
                    }
                  }
                }
              } catch (e) {
                return handler.next(
                  WeatherNoBodyException(
                    message: 'Something went wrong',
                    type: DioErrorType.response,
                    requestOptions: RequestOptions(path: ''),
                    error: error,
                  ),
                );
              }
              final statusCode = error.response!.statusCode!;

              if (statusCode >= 500 && statusCode != 503) {
                return handler.next(
                  WeatherInternalServerErrors(
                    message: 'Internal Server Error',
                    type: DioErrorType.response,
                    requestOptions: RequestOptions(path: ''),
                    error: error,
                  ),
                );
              } else if (statusCode == 503) {
                return handler.next(
                  WeatherInternalServerErrors(
                    message: 'Server unavailable',
                    type: DioErrorType.response,
                    requestOptions: RequestOptions(path: ''),
                    error: error,
                  ),
                );
              } else if (statusCode >= 400 &&
                  statusCode < 500 &&
                  statusCode != 401 &&
                  statusCode != 404) {
                return handler.next(
                  WeatherException(
                    message: errorMessage ?? 'Something went wrong',
                    requestOptions: RequestOptions(path: ''),
                    type: DioErrorType.response,
                    error: error,
                  ),
                );
              } else if (statusCode == 401) {
                // await _tokenStorage.storeToken('');
                // sl<AppBloc>().add(const AppEvent.logOut());
                return handler.next(
                  ForbiddenException(
                    message: errorMessage ?? 'Something went wrong',
                    type: DioErrorType.response,
                    requestOptions: RequestOptions(path: ''),
                    error: error,
                  ),
                );
              } else if (statusCode == 404) {
                return handler.next(
                  NoDataException(
                    message: errorMessage ?? 'Something went wrong',
                    type: DioErrorType.response,
                    requestOptions: RequestOptions(path: ''),
                    error: error,
                  ),
                );
              }
            }
          }
          return handler.next(error);
        },
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        responseHeader: true,
        requestBody: true,
        logPrint: logInfo,
        compact: false,
      ),
    );
    return dio;
  }
}
