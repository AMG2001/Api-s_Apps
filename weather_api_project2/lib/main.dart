import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api_project2/pages/home_page/cubit/home_page_cubit.dart';
import 'package:weather_api_project2/pages/home_page/home_page.dart';

void main(List<String> args) {
  runApp(NewsApp());
}



class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageCubit>(
      create: (context) => HomePageCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "News App",
          home: HomePage(),
        ),
    );
  }
}