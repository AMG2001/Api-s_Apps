import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api_project2/pages/home_page/cubit/home_page_cubit.dart';
import 'package:weather_api_project2/model/news/news_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**
     * BlocProvider obj to access all Cubit methods and Data.
     */
    final blocProviderObj = BlocProvider.of<HomePageCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("News Page"),
      ),
      body: BlocBuilder<HomePageCubit, HomePageState>(
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
          }
          /**
           * if the Coming State is Loading State .. 
           */
          else if (state is HomePageLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          /**
           * after load News .. show them
           */
          else if (state is HomePageShowNewsState) {
            Navigator.pop(context);
            return SafeArea(
                child: ListView.builder(
              itemCount: blocProviderObj.listOfNewsContainers.length,
              itemBuilder: (context, index) {
                return blocProviderObj.listOfNewsContainers[index];
              },
            ));
          }
          /**
           * if there is any erorrs .. how error message
           */
          else {
            return Center(
              child: Text("Error"),
            );
          }
        },
      ),
    );
  }
}
