import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/injectable/injectable.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_models/search_news/news_data_model.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_models/search_news/search_news_data_model.dart';
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
    final database = getIt<Database>();
    final dbSearchNews = database.into(database.searchNews);
    final dbNews = database.into(database.news);
    final categoryId = await dbSearchNews.insert(
        SearchNewsCompanion.insert(
        status: searchNewsModel.status,
        page: searchNewsModel.page,
        queryString: queryString,
        saveData: saveData),
    );
    for(final element in searchNewsModel.news){
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
    }
  }


  @override
  Future<List<SearchNewsDataModel>> loadAllNews() async {
    final Database database = getIt();
    List<SearchNewsDataModel> searchNewsModelList = [];
    final searchNewsTable = await database.select(database.searchNews).get();

    for(final searchNewsElement in searchNewsTable){
      final newsTable = database.select(database.news)..where((rows) => rows.searchNewsId.isValue(searchNewsElement.id));
      final newsRow = await newsTable.get();
      List<NewsDataModel> newsModelList = [];
      for(final newsElement in newsRow){
        newsModelList.add(NewsDataModel(
            newsId: newsElement.newsId,
            title: newsElement.title,
            description: newsElement.description,
            url: newsElement.url,
            author: newsElement.author,
            image: newsElement.image,
            language: newsElement.language,
            category: newsElement.category,
            published: newsElement.published));
      }
      searchNewsModelList.add(SearchNewsDataModel(
          id: searchNewsElement.id,
          status: searchNewsElement.status,
          news: newsModelList,
          queryString: searchNewsElement.queryString,
          saveData: searchNewsElement.saveData));
    }
    return searchNewsModelList;
  }

  @override
  Future<SearchNewsModel> selectSearchNewsModelById(int id) async {
    final Database database = getIt();
    final SearchNewsModel searchNewsModel;
    final rowSearchNewsWithId = database.select(database.searchNews)
      ..where((row) => row.id.isValue(id));
    final rowNewsWithIdOfSearchNews = database.select(database.news)
      ..where((rows) => rows.searchNewsId.isValue(id));
    final List<NewsModel> newsModelList = [];
    for(final row in await rowNewsWithIdOfSearchNews.get()) {
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
    if(rowsSearchNews.isEmpty) throw DatabaseFailure();
    searchNewsModel = SearchNewsModel(
        status: rowsSearchNews.first.status,
        news: newsModelList,
        page: rowsSearchNews.first.page);
    return searchNewsModel;
  }

  @override
  Future<String?> selectQueryLastModel() async{
    final database = getIt<Database>();
    final searchNews = await database.select(database.searchNews).get();
    if(searchNews.isEmpty){
      return null;
    }
      final query = searchNews.last.queryString;
      return query;

  }

}

