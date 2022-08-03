import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api_project1/services/weather_api/weather_api_cubit/weather_api_cubit.dart';
import 'package:weather_api_project1/services/weather_api/weather_api_cubit/weather_api_state.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherApiCubit, WeatherApiState>(
      builder: (context, state) {
        final blocProviderObj = BlocProvider.of<WeatherApiCubit>(context);
        return Container(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${blocProviderObj.cityWeatherDataObj.cityName} , ${blocProviderObj.cityWeatherDataObj.cityCountry}",
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "${blocProviderObj.cityWeatherDataObj.day} , ${blocProviderObj.cityWeatherDataObj.time}",
                  style: TextStyle(
                      color: Color.fromARGB(255, 169, 173, 169), fontSize: 14),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
