import 'package:flutter/material.dart';
import 'package:retrofit_moment/core/assets/my_text_styles/my_text_styles.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_entity/news_entity.dart';
import 'package:retrofit_moment/features/search_news_feature/presentation/screens/widget/network_or_asset_loaded_listview_tile_widget.dart';

class ListviewTileSearchNews extends StatelessWidget {
  const ListviewTileSearchNews({super.key, required this.newsEntity});
  final NewsEntity newsEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          newsEntity.title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: MyTextStyles.mediumNewsTitleTextStyle,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          newsEntity.description,
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: NetworkOrAssetLoadedListviewTileWidget.networkOrAssetLoadedListviewTileWidget(newsEntity),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            newsEntity.published.replaceRange(19, null, ''),
            style: MyTextStyles.authorNewsTextStyle,
            maxLines: 1,
          ),
          Text(
            newsEntity.author,
            style: MyTextStyles.authorNewsTextStyle,
            maxLines: 1,
          )
        ],
      ),
    );
  }
}
