import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather_api_project1/pages/city_weather_page/city_weather_data.dart';
import 'package:weather_api_project1/services/weather_api/weather_api_cubit/weather_api_state.dart';

class WeatherApiCubit extends Cubit<WeatherApiState> {
  WeatherApiCubit({required this.cityName}) : super(WeatherApiInitialState());
  /**
   * Object that will contain all required data for the city weather page.
   */
  late CityWeatherDataClass cityWeatherDataObj;
  String cityName;
  var decodedCityData;
  Future<void> getCityData() async {
    cityName = "cairo";
    /**
     * Show Loading Indicator in HomePage
     */
    print("Send loading State");
    emit(WeatherApiLoadingState());
    /**
     * Http Request
     */
    final response = await http.get(Uri.parse(
        "https://api.weatherapi.com/v1/current.json?key=3339302a4a31493cb7511349220308&q=$cityName&aqi=yes"));
    /**
    * Check if the Request sent Correctly
    * if not .. send Faluire State to HomePage
    */
    if (response.statusCode == 200) {
      decodedCityData = jsonDecode(response.body);
      /**
       * Passing data to cityWeatherDataObj that Contain all required information
       */
      cityWeatherDataObj = CityWeatherDataClass(
          cityName: decodedCityData["location"]["name"],
          cityCountry: decodedCityData["location"]["country"],
          weatherState: decodedCityData["current"]["condition"]["text"],
          weatherIconLink: decodedCityData["current"]["condition"]["icon"],
          weatherTemp: decodedCityData["current"]["temp_c"],
          day: DateFormat.d().toString(),
          time: DateFormat.j().toString());
      /**
           * Send Success State to Home Page
           */
      print("Send Success State");
      emit(WeatherApiSuccessState());
      print("Weather Api Success State is sent #");
    } else {
      print("Send Failure State");
      emit(WeatherApiFaliureState());
    }
  }
}
