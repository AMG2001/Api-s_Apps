import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api_project2/pages/home_page/cubit/home_page_cubit.dart';
import 'package:weather_api_project2/model/news/news_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocProviderObj = BlocProvider.of<HomePageCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("News Page"),
      ),
      body: BlocConsumer<HomePageCubit, HomePageState>(
        listener: (context, state) {
          if (state is HomePageLoadingState) {
            showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          }
        },
        builder: (context, state) {
          if (state is HomePageInitialState) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Welcome in Our News App"),
                  SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        blocProviderObj.getNews();
                      },
                      child: Text("Click to Show News"))
                ],
              ),
            );
          } else if (state is HomePageShowNewsState) {
            Navigator.pop(context);
            return SafeArea(
                child: ListView.builder(
              itemCount: blocProviderObj.listOfNewsContainers.length,
              itemBuilder: (context, index) {
                return blocProviderObj.listOfNewsContainers[index];
              },
            ));
          } else {
            return Center(
              child: Text("Error"),
            );
          }
        },
      ),
    );
  }
}
