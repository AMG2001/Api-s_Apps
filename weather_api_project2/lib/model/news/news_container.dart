import 'package:flutter/material.dart';
import 'package:weather_api_project2/model/news/new_model_class.dart';

class NewContainer extends StatelessWidget {
  NewsModel newsModel;
  NewContainer({required this.newsModel});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height * .5,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .2,
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(newsModel.imageUrl),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            newsModel.title,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            newsModel.description,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "By ${newsModel.publisherName}",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(newsModel.newsDate)
              ],
            ),
          )
        ],
      ),
    );
  }
}
