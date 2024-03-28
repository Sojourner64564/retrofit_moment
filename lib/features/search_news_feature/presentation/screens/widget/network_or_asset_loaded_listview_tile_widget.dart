import 'package:flutter/material.dart';
import 'package:retrofit_moment/core/assets/my_links/my_links.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_entity/news_entity.dart';

class NetworkOrAssetLoadedListviewTileWidget{
  static Widget networkOrAssetLoadedListviewTileWidget(NewsEntity newsEntity) {
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