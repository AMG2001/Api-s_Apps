import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:weather_api_project2/model/news/new_model_class.dart';
import 'package:weather_api_project2/model/news/news_container.dart';
part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitialState());
  List<NewContainer> listOfNewsContainers = [];

  void getNews() async {
    emit(HomePageLoadingState());
    http.Response news = await http.get(Uri.parse(
        "https://gnews.io/api/v4/search?q=example&token=e4de66c4aae6486d2582fb1da12fca59"));
    var decodedNews = jsonDecode(news.body);
    print("Decoded News: $decodedNews");
    for (int i = 0; i < 10; i++) {
      print("New Number $i added SuccessFully ##");
      listOfNewsContainers.add(
        NewContainer(
          newsModel: NewsModel(
              title: decodedNews["articles"][i]["title"],
              description: decodedNews["articles"][i]["description"],
              imageUrl: decodedNews["articles"][i]["image"],
              publisherName: decodedNews["articles"][i]["source"]["name"],
              newsDate: decodedNews["articles"][i]["publishedAt"]),
        ),
      );
    }
    print(
        "List of News Containers: ${listOfNewsContainers[0].newsModel.title}");
    emit(HomePageShowNewsState());
  }
}
