import 'package:flutter/material.dart';
import 'package:retrofit_moment/core/assets/my_links/my_links.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_data_entity/search_news_data_entity.dart';

class NetworkOrAssetLoadSearchNews{
 static Widget networkOrAssetLoadSearchNews(SearchNewsDataEntity searchNewsDataEntity) {
    if (searchNewsDataEntity.news.isEmpty) {
      return Image.asset(MyLinks.assetDefaultImage, fit: BoxFit.fill);
    }
    if(searchNewsDataEntity.news.first.image == 'None' || searchNewsDataEntity.news.first.image == '') {
      return Image.asset(MyLinks.assetDefaultImage, fit: BoxFit.fill);
    } else {
      try{
        return Image.network(searchNewsDataEntity.news[0].image,
            fit: BoxFit.fitHeight);
      }catch(e){
        return Image.asset(MyLinks.assetDefaultImage, fit: BoxFit.fill);
      }

    }
  }
}