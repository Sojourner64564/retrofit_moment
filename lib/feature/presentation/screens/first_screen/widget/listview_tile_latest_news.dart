import 'package:flutter/material.dart';
import 'package:retrofit_moment/core/assets/my_text_styles/my_text_styles.dart';
import 'package:retrofit_moment/feature/data/models/latest_news/news_model.dart';

class ListviewTileLatestNews extends StatelessWidget{
  const ListviewTileLatestNews({super.key, required this.newsModel,});

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
           Center(child: Text(
             newsModel.title,
           style: MyTextStyles.newsTitleTextStyle,
           )),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:  Image.network(
                newsModel.image=='None' || newsModel.image=='' ?
                'https://cdn.cnn.com/cnnnext/dam/assets/230725145534-mayorkas-may-11-file-super-tease.jpg'
                    : newsModel.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Center(child: Text(newsModel.description)),
          const SizedBox(height: 5),
          Text(newsModel.published.replaceRange(19, null, ''),
            style: MyTextStyles.authorNewsTextStyle,
            maxLines: 3,
          ),
          const SizedBox(height: 5),
          Text(newsModel.author,
          style: MyTextStyles.authorNewsTextStyle,
            maxLines: 3,
          ),

        ],
      ),
    );
  }

}