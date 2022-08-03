import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api_project1/pages/city_weather_page/city_weather_page_components/city_weather_state.dart';
import 'package:weather_api_project1/pages/city_weather_page/city_weather_page_components/page_header.dart';
import 'package:weather_api_project1/services/weather_api/weather_api_cubit/weather_api_cubit.dart';
class CityWeatherPage extends StatelessWidget {
  late WeatherApiCubit weatherAppCubitObj;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherApiCubit>(
      create: (context) =>
          WeatherApiCubit(cityName: weatherAppCubitObj.cityName),
      child: BlocBuilder(
        builder: (context, state) {
          weatherAppCubitObj = BlocProvider.of<WeatherApiCubit>(context);
          return Scaffold(
            body: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Expanded(flex: 1, child: PageHeader()),
                    Expanded(flex: 2, child: CityWeatherState()),
                    Expanded(flex: 3, child: Container()),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
