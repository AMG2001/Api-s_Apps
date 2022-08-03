import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api_project1/model/pages_name_model.dart';
import 'package:weather_api_project1/pages/city_weather_page/city_weather_page.dart';
import 'package:weather_api_project1/pages/home_page/home_page.dart';
import 'package:weather_api_project1/services/weather_api/weather_api_cubit/weather_api_cubit.dart';
import 'package:weather_api_project1/services/weather_api/weather_api_cubit/weather_api_state.dart';

void main() {
  runApp(const WeatherApiApp());
}

class WeatherApiApp extends StatelessWidget {
  const WeatherApiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherApiCubit>(
      create: (context) =>
          WeatherApiCubit(cityName: HomePage().cityNameController.text),
      child: MaterialApp(
        routes: {
          PagesNameModel.homePageName: (context) => HomePage(),
          PagesNameModel.weatherPageName: (context) => CityWeatherPage(),
        },
        title: "Weater Api App",
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
