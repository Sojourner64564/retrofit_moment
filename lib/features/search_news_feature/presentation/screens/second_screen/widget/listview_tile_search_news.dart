import 'package:flutter/material.dart';
import 'package:retrofit_moment/core/assets/my_text_styles/my_text_styles.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/news_model.dart';

class ListviewTileSearchNews extends StatelessWidget {
  const ListviewTileSearchNews({super.key, required this.newsModel});
  final NewsModel newsModel;

  Widget networkOrAsset(){
    if(newsModel.image == 'None' || newsModel.image == ''){
      return Image.asset('assets/images/default_image.jpg',fit: BoxFit.fill);
    }else{
      return Image.network(newsModel.image,fit: BoxFit.fitHeight);
    }
  }

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
                          newsModel.title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: MyTextStyles.mediumNewsTitleTextStyle,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          newsModel.description,
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
                      child: networkOrAsset(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(newsModel.published.replaceRange(19, null, ''),
            style: MyTextStyles.authorNewsTextStyle,
            maxLines: 1,
          ),
          Text(newsModel.author,
          style: MyTextStyles.authorNewsTextStyle,
            maxLines: 1,

          )
        ],
      ),
    );
  }
}
