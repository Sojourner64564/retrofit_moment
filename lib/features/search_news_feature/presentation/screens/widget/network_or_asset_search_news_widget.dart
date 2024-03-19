import 'package:flutter/material.dart';
import 'package:retrofit_moment/core/links/my_links.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_models/search_news_data_model.dart';

class NetworkOrAssetSearchNews{
 static Widget networkOrAssetSearchNews(SearchNewsDataModel searchNewsDataModel) {
    if (searchNewsDataModel.news.isEmpty) {
      return Image.asset(MyLinks.assetDefaultImage, fit: BoxFit.fill);
    }
    if(searchNewsDataModel.news.first.image == 'None' || searchNewsDataModel.news.first.image == '') {
      return Image.asset(MyLinks.assetDefaultImage, fit: BoxFit.fill);
    } else {
      try{
        return Image.network(searchNewsDataModel.news[0].image,
            fit: BoxFit.fitHeight);
      }catch(e){
        return Image.asset(MyLinks.assetDefaultImage, fit: BoxFit.fill);
      }

    }
  }
}