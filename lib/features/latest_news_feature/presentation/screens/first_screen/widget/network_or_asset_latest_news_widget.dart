import 'package:flutter/material.dart';
import 'package:retrofit_moment/core/links/my_links.dart';
import 'package:retrofit_moment/features/latest_news_feature/domain/entity/news_entity.dart';

class NetworkOrAssetLatestNews{
  static Widget networkOrAssetLatestNews(NewsEntity newsEntity) {
    if (newsEntity.image == 'None' || newsEntity.image == '') {
      return Image.asset(
        MyLinks.assetDefaultImage,
        fit: BoxFit.fill,
      );
    } else {
      try{
        return Image.network(newsEntity.image, fit: BoxFit.fitHeight);
      }catch(e){
        return Image.asset(
          MyLinks.assetDefaultImage,
          fit: BoxFit.fill,
        );
      }
    }
  }
}