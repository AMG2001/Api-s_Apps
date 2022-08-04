import 'package:flutter/material.dart';
import 'package:weather_api_project2/model/news/new_model_class.dart';

/**
 * Modeled Container for the every New
 */
class NewContainer extends StatelessWidget {
  /**
   * News model is modeling the data of the new .. take required data about the new 
   * and add then to modeled Object.
   */
  NewsModel newsModel;
  NewContainer({required this.newsModel});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /**
           * News Image Container 
           */
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
          /**
           * Title of New
           */
          Text(
            newsModel.title,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          SizedBox(
            height: 12,
          ),
          /**
           * Description of new
           */
          Text(
            newsModel.description,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          SizedBox(
            height: 12,
          ),
          /**
           * Source of New and date of publishing
           */
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
