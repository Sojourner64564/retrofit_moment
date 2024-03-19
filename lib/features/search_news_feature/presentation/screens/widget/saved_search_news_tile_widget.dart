import 'package:flutter/material.dart';
import 'package:retrofit_moment/core/assets/my_colors/my_colors.dart';
import 'package:retrofit_moment/core/assets/my_text_styles/my_text_styles.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_models/search_news_data_model.dart';
import 'package:retrofit_moment/features/search_news_feature/presentation/screens/widget/network_or_asset_search_news_widget.dart';

class SavedSearchNewsTileWidget extends StatelessWidget {
  const SavedSearchNewsTileWidget({super.key, required this.searchNewsDataModel});
  final SearchNewsDataModel searchNewsDataModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: 150,
        height: 40,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: NetworkOrAssetSearchNews.networkOrAssetSearchNews(searchNewsDataModel),
            ),
            Container(
              decoration: BoxDecoration(
                color: MyColors.myBlack54Colors,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    searchNewsDataModel.queryString,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: MyTextStyles.mediumThickWhiteTextStyle,
                  ),
                  const Expanded(
                    child: Divider(
                      indent: 15,
                      endIndent: 15,
                      thickness: 1,
                      color: MyColors.myWhiteColor,
                    ),
                  ),
                  Text(
                    searchNewsDataModel.saveData,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: MyTextStyles.littleThickWhiteTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
