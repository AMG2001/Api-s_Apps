import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_api_project1/model/pages_name_model.dart';
import 'package:weather_api_project1/services/weather_api/weather_api_cubit/weather_api_cubit.dart';
import 'package:weather_api_project1/services/weather_api/weather_api_cubit/weather_api_state.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  GlobalKey<FormState> homePageGlobalKey = GlobalKey<FormState>();
  TextEditingController cityNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search City"),
      ),
      body: BlocConsumer<WeatherApiCubit, WeatherApiState>(
        /**
         * Listen to the state of the WeatherApiCubit
         */
          listener: (context, state) {
        if (state is WeatherApiSuccessState) {
          print("Weather success State Recived #");
          /**
           * Navigate to CityWeatherPage
           */
          Navigator.pushNamed(context, PagesNameModel.weatherPageName);
        }
      }, 
      /**
       * Builder 
       */
      builder: (context, state) {
        if (state is WeatherApiInitialState) {
          print("Weather Initial State Recived #");
          return SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Form(
                key: homePageGlobalKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Lottie.asset(
                        'assets/animated_vectors/home_page_animation.json'),
                    Container(
                      width: MediaQuery.of(context).size.width * .8,
                      child: TextFormField(
                        validator: (data) {
                          if (data == "" || data == null)
                            return "Please enter a city name !!";
                        },
                        controller: cityNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)),
                          labelText: "City Name",
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (homePageGlobalKey.currentState!.validate()) {
                            print(
                                "Controlelr Text is : ${cityNameController.text}");

                            await WeatherApiCubit(
                                    cityName: cityNameController.text)
                                .getCityData();
                          }
                        },
                        child: Text("Search now"))
                  ],
                ),
              ),
            ),
          );
        } else if (state is WeatherApiLoadingState) {
          print("Weather Loading State Recived #");
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          print("Weather Faliure State Recived #");
          return Center(
            child: Text("Faliure"),
          );
        }
      }),
    );
  }
}
