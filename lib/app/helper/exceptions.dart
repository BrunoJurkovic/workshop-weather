// 📦 Package imports:
// ignore_for_file: strict_raw_type

import 'package:dio/dio.dart';

class NoDataException implements DioError {
  NoDataException({
    required this.message,
    this.stackTrace,
    this.response,
    required this.type,
    required this.requestOptions,
    required this.error,
  });

  @override
  String toString() {
    return message;
  }

  @override
  final String message;

  @override
  dynamic error;

  @override
  RequestOptions requestOptions;

  @override
  Response? response;

  @override
  StackTrace? stackTrace;

  @override
  DioErrorType type;
}

class NetworkSocketException implements DioError {
  NetworkSocketException({
    required this.message,
    this.stackTrace,
    this.response,
    required this.type,
    required this.requestOptions,
    required this.error,
  });

  @override
  String toString() {
    return message;
  }

  @override
  final String message;

  @override
  dynamic error;

  @override
  RequestOptions requestOptions;

  @override
  Response? response;

  @override
  StackTrace? stackTrace;

  @override
  DioErrorType type;
}

class ForbiddenException implements DioError {
  ForbiddenException({
    required this.message,
    this.stackTrace,
    this.response,
    required this.type,
    required this.requestOptions,
    required this.error,
  });

  @override
  String toString() {
    return message;
  }

  @override
  final String message;

  @override
  dynamic error;

  @override
  RequestOptions requestOptions;

  @override
  Response? response;

  @override
  StackTrace? stackTrace;

  @override
  DioErrorType type;
}

class WeatherNoBodyException implements DioError {
  WeatherNoBodyException({
    required this.message,
    this.stackTrace,
    this.response,
    required this.type,
    required this.requestOptions,
    required this.error,
  });

  @override
  String toString() {
    return message;
  }

  @override
  final String message;

  @override
  dynamic error;

  @override
  RequestOptions requestOptions;

  @override
  Response? response;

  @override
  StackTrace? stackTrace;

  @override
  DioErrorType type;
}

class WeatherInternalServerErrors implements DioError {
  WeatherInternalServerErrors({
    required this.message,
    this.stackTrace,
    this.response,
    required this.type,
    required this.requestOptions,
    required this.error,
  });

  @override
  String toString() {
    return message;
  }

  @override
  final String message;

  @override
  dynamic error;

  @override
  RequestOptions requestOptions;

  @override
  Response? response;

  @override
  StackTrace? stackTrace;

  @override
  DioErrorType type;
}

class WeatherException implements DioError {
  WeatherException({
    required this.message,
    this.stackTrace,
    this.response,
    required this.type,
    required this.requestOptions,
    required this.error,
  });

  @override
  String toString() {
    return message;
  }

  @override
  final String message;

  @override
  dynamic error;

  @override
  RequestOptions requestOptions;

  @override
  Response? response;

  @override
  StackTrace? stackTrace;

  @override
  DioErrorType type;
}

class SomethingWentWrongException implements Exception {
  SomethingWentWrongException({
    this.message = 'Something went wrong, please try again later.',
  });

  final String message;
  @override
  String toString() {
    return message;
  }
}
