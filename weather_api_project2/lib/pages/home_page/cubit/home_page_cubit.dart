import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:weather_api_project2/model/news/new_model_class.dart';
import 'package:weather_api_project2/model/news/news_container.dart';
part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitialState());
  /**
   * List will contain the whole news that will be showen in home page - ListView
   */
  List<NewContainer> listOfNewsContainers = [];

  void getNews() async {
    /**
     * Send Loading State to HomePage
     */
    emit(HomePageLoadingState());
    try {
      /**
     * Perform Http Request
     */
      http.Response news = await http.get(Uri.parse(
          "https://gnews.io/api/v4/search?q=example&token=e4de66c4aae6486d2582fb1da12fca59"));
      /**
         * Decode the Response
         */
      var decodedNews = jsonDecode(news.body);
      /**
     * Take only First 10 news and add them to list
     */
      for (int i = 0; i < 10; i++) {
        /**
     * We have made modeled Container for each new  
     */
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
      /**
     * After Adding News to List, Send Show News in HomePage
     */
      emit(HomePageShowNewsState());
    } catch (e) {
      /**
        * If Error Occurs, Send Error State to HomePage
        */
      print(e);
      emit(HomePageFaluireState());
    }
  }
}
