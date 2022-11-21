// ignore_for_file: use_decorated_box

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';
import 'package:weatherworkshop/app/services/service_locator.dart';
import 'package:weatherworkshop/weather/presentation/bloc/weather_bloc.dart';
import 'package:weatherworkshop/widgets/search_field.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

int hour = DateTime.now().hour;

class _WeatherScreenState extends State<WeatherScreen> {
  late GlobalKey<FormBuilderState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BlocProvider(
        create: (context) => sl<WeatherBloc>(),
        child: Builder(builder: (context) {
          return Scaffold(
            body: FormBuilder(
              key: _formKey,
              child: Stack(
                children: [
                  buildBackground(),
                  Padding(
                    padding: EdgeInsets.only(top: 100.h),
                    child: Row(
                      children: [
                        SearchField(
                          name: 'weatherSearch',
                          width: 540.w,
                          leftPadding: 90.w,
                          hintText: 'Search for a city...',
                          outlineColor: (hour > 8 && hour < 17)
                              ? Colors.white
                              : Colors.amberAccent,
                        ),
                        SizedBox(
                          width: 25.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            var city = '';
                            _formKey.currentState?.save();
                            if (_formKey.currentState!.validate()) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              city = _formKey.currentState
                                  ?.value['weatherSearch'] as String;
                              context.read<WeatherBloc>().add(
                                    WeatherEvent.fetch(
                                      city,
                                    ),
                                  );
                            } else {}
                          },
                          child: Icon(
                            Icons.search_outlined,
                            size: 90.r,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 200.h,
                    left: 25.h,
                    child: BlocBuilder<WeatherBloc, WeatherState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () {
                            return Column(
                              children: [
                                SizedBox(
                                  width: 640.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      // Icon(
                                      //   Icons.sunny_snowing,
                                      //   size: 250.r,
                                      //   color: Colors.white,
                                      // ),
                                      const Text(
                                        '- °C',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 70,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 390.w),
                                  child: const Text(
                                    'Zagreb',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 620.h,
                                ),
                              ],
                            );
                          },
                          loading: CircularProgressIndicator.new,
                          loaded: (weather, cityName) {
                            return Column(
                              children: [
                                SizedBox(
                                  width: 640.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // if (weather.conditionId == 800)
                                      //   Icon(
                                      //     Icons.sunny,
                                      //     size: 250.r,
                                      //     color: Colors.white,
                                      //   ),
                                      // if (weather.conditionId >= 200 &&
                                      //     weather.conditionId <= 232)
                                      //   Icon(
                                      //     Icons.cloud,
                                      //     size: 250.r,
                                      //     color: Colors.white,
                                      //   ),
                                      // if (weather.conditionId >= 300 &&
                                      //     weather.conditionId <= 531)
                                      //   Icon(
                                      //     Icons.cloud_circle,
                                      //     size: 250.r,
                                      //     color: Colors.white,
                                      //   ),
                                      // if (weather.conditionId >= 600 &&
                                      //     weather.conditionId <= 781)
                                      //   Icon(
                                      //     Icons.cloud_done,
                                      //     size: 250.r,
                                      //     color: Colors.white,
                                      //   ),
                                      Text(
                                        weather.temp.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 70,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 390.w),
                                  child: Text(
                                    cityName,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 620.h,
                                ),
                              ],
                            );
                          },
                          error: () => const Text(
                            textAlign: TextAlign.center,
                            'Something went wrong! \nPlease try again.',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.amber,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

//Builder metoda
  Widget buildBackground() {
    return (hour > 8 && hour < 17)
        ? Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: (hour > 8 && hour < 17)
                    ? const AssetImage('assets/light.jpg')
                    : const AssetImage('assets/dark.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          )
        : const RiveAnimation.asset(
            'assets/1690-3340-starry-starry-night.riv',
            fit: BoxFit.cover,
          );
  }
}
