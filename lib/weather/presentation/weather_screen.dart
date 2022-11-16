// ignore_for_file: use_decorated_box

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';
import 'package:weatherworkshop/widgets/search_field.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

int hour = DateTime.now().hour;

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Stack(
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
                    onTap: () {},
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
              child: Column(
                children: [
                  SizedBox(
                    width: 640.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.sunny_snowing,
                          size: 250.r,
                          color: Colors.white,
                        ),
                        const Text(
                          '25° C',
                          style: TextStyle(color: Colors.white, fontSize: 70),
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
                      'Zadar',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  SizedBox(
                    height: 620.h,
                  ),
                ],
              ),
            ),
          ],
        ),
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
