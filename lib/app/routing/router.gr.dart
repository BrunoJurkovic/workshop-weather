// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    WeatherRoute.name: (routeData) {
      return MaterialPageX<void>(
        routeData: routeData,
        child: const WeatherScreen(),
      );
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          WeatherRoute.name,
          path: '/',
        )
      ];
}

/// generated route for
/// [WeatherScreen]
class WeatherRoute extends PageRouteInfo<void> {
  const WeatherRoute()
      : super(
          WeatherRoute.name,
          path: '/',
        );

  static const String name = 'WeatherRoute';
}
