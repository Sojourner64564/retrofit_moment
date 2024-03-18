import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/injectable/injectable.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_models/news_data_model.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_models/search_news_data_model.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/data/search_news_local_drift_database/search_news_local_drift_database.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_source/search_news_data_source_local.dart';

@LazySingleton(as: SearchNewsDataSourceLocal)
class SearchNewsDataSourceLocalImpl extends SearchNewsDataSourceLocal {
  @override
  Future<void> saveModelToBd(
    SearchNewsModel searchNewsModel,
    String queryString,
    String saveData,
  ) async {
    final Database database = getIt();

    final dbSearchNews = database.into(database.searchNews);
    final dbNews = database.into(database.news);
    final categoryId = await dbSearchNews.insert(SearchNewsCompanion.insert(
        status: searchNewsModel.status,
        page: searchNewsModel.page,
        queryString: queryString,
        saveData: saveData));
    searchNewsModel.news.map((element) {
      dbNews.insert(NewsCompanion.insert(
          newsId: element.id,
          title: element.title,
          description: element.description,
          url: element.url,
          author: element.author,
          image: element.image,
          language: element.language,
          category: element.category,
          published: element.published,
          searchNewsId: categoryId));
    });
  }

  @override
  Future<SearchNewsModel> selectLastModelFromBd() async {
    final Database database = getIt();
    final List<NewsModel> newsModelList = [];
    final searchNewsTable = await database.select(database.searchNews).get();
    final newsSorted = database.select(database.news)
      ..where((row) => row.searchNewsId.isValue(searchNewsTable.last.id));
    (await newsSorted.get()).map((element) => newsModelList.add(
        NewsModel(
          id: element.newsId,
          title: element.title,
          description: element.description,
          url: element.url,
          author: element.author,
          image: element.image,
          language: element.language,
          category: element.category,
          published: element.published,
        )
    ));
    return SearchNewsModel(
      status: searchNewsTable.last.status,
        news: newsModelList,
        page: searchNewsTable.last.page,);
  }


  Future<List<SearchNewsDataModel>> loadAllNews() async {
    final Database database = getIt();
    List<SearchNewsDataModel> searchNewsModelList = [];

    final searchNewsTable = await database.select(database.searchNews).get();

    for (int i = 0; i < searchNewsTable.length; i++) {
      final rowSearchNews = searchNewsTable[i];
      final searchNewsId = rowSearchNews.id;
      final newsTable = database.select(database.news)
        ..where((rows) => rows.searchNewsId.isValue(searchNewsId));
      final newsRow = await newsTable.get();
      List<NewsDataModel> newsModelList = [];

      for (int b = 0; b < newsRow.length; b++) {
        final row = newsRow[b];
        newsModelList.add(NewsDataModel(
            newsId: row.newsId,
            title: row.title,
            description: row.description,
            url: row.url,
            author: row.author,
            image: row.image,
            language: row.language,
            category: row.category,
            published: row.published));
      }
      searchNewsModelList.add(
        SearchNewsDataModel(
          id: rowSearchNews.id,
          status: rowSearchNews.status,
          news: newsModelList,
          queryString: rowSearchNews.queryString,
          saveData: rowSearchNews.saveData
        ),
      );
    }
    return searchNewsModelList;
  }

  @override
  Future<SearchNewsModel> selectSearchNewsModelById(
    int id) async {
    final Database database = getIt(); //TODO сделать читаемым
    final SearchNewsModel searchNewsModel;
    final rowSearchNewsWithId = database.select(database.searchNews)
      ..where((row) => row.id.isValue(id));
    final rowNewsWithIdOfSearchNews = database.select(database.news)
      ..where((rows) => rows.searchNewsId.isValue(id));
    final List<NewsModel> newsModelList = [];
    for (final row in await rowNewsWithIdOfSearchNews.get()) {
      newsModelList.add(NewsModel(
        id: row.newsId,
        title: row.title,
        description: row.description,
        url: row.url,
        author: row.author,
        image: row.image,
        language: row.language,
        category: row.category,
        published: row.published,
      ));
    }
    final rowsSearchNews = await rowSearchNewsWithId.get();
    searchNewsModel = SearchNewsModel(
        status: rowsSearchNews[0].status,
        news: newsModelList,
        page: rowsSearchNews[0].page);
    return searchNewsModel;
  }

  @override
  Future<String?> selectQueryLastModel() async{
    final Database database = getIt();
    final searchNews = await database.select(database.searchNews).get();
    if(searchNews.isEmpty){
      return null;
    }
      final query = searchNews.last.queryString;
      return query;

  }

}

