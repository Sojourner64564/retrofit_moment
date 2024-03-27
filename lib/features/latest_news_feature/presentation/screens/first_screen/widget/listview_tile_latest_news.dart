import 'package:flutter/material.dart';
import 'package:retrofit_moment/core/assets/my_text_styles/my_text_styles.dart';
import 'package:retrofit_moment/features/latest_news_feature/domain/entity/news_entity.dart';
import 'package:retrofit_moment/features/latest_news_feature/presentation/screens/first_screen/widget/network_or_asset_latest_news_widget.dart';

class ListviewTileLatestNews extends StatelessWidget{
  const ListviewTileLatestNews({super.key, required this.newsEntity,});

  final NewsEntity newsEntity;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
           Center(child: Text(
             newsEntity.title,
           style: MyTextStyles.newsTitleTextStyle,
           )),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:  NetworkOrAssetLatestNews.networkOrAssetLatestNews(newsEntity),
            ),
          ),
          const SizedBox(height: 5),
          Center(child: Text(newsEntity.description)),
          const SizedBox(height: 5),
          Text(newsEntity.published.replaceRange(19, null, ''),
            style: MyTextStyles.authorNewsTextStyle,
            maxLines: 3,
          ),
          const SizedBox(height: 5),
          Text(newsEntity.author,
          style: MyTextStyles.authorNewsTextStyle,
            maxLines: 3,
          ),
        ],
      ),
    );
  }

}