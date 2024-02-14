import 'package:flutter/material.dart';
import 'package:retrofit_moment/core/assets/my_text_styles/my_text_styles.dart';
import 'package:retrofit_moment/feature/data/models/search_news/news_model.dart';

class ListviewTileSearchNews extends StatefulWidget {
  const ListviewTileSearchNews({super.key, required this.newsModel});
  final NewsModel newsModel;

  @override
  State<ListviewTileSearchNews> createState() => _ListviewTileSearchNewsState();
}

class _ListviewTileSearchNewsState extends State<ListviewTileSearchNews> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                          widget.newsModel.title,
                          softWrap: true,
                          maxLines: 3,
                          style: MyTextStyles.mediumNewsTitleTextStyle,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.newsModel.description,
                          softWrap: true,
                          maxLines: 7,
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
                      child: Image.network(
                        widget.newsModel.image=='None' || widget.newsModel.image=='' ?
                        'https://cdn.cnn.com/cnnnext/dam/assets/230725145534-mayorkas-may-11-file-super-tease.jpg'
                            : widget.newsModel.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(widget.newsModel.published,
            style: MyTextStyles.authorNewsTextStyle,
            maxLines: 1,
          ),
          Text(widget.newsModel.author,
          style: MyTextStyles.authorNewsTextStyle,
            maxLines: 1,

          )
        ],
      ),
    );
  }
}
