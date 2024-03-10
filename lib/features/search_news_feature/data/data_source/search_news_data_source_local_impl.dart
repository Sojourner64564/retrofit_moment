import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/injectable/injectable.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/data/search_news_local_drift_database/search_news_local_drift_database.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_source/search_news_data_source_local.dart';

@lazySingleton
class  SearchNewsDataSourceLocalImpl extends SearchNewsDataSourceLocal{
  @override
  Database getDb() {
    final Database db = getIt();
    return db;
  }

  @override
  Future<void> saveModelToBd(Database database, SearchNewsModel searchNewsModel) async{
    final categoryId = await database.into(database.searchNews)
        .insert(SearchNewsCompanion.insert(status: searchNewsModel.status, page: searchNewsModel.page));
    for(int i=0;i<searchNewsModel.news.length;i++){
     await database.into(database.news).
     insert(NewsCompanion.insert(newsId: searchNewsModel.news[i].id, title: searchNewsModel.news[i].title,
         description: searchNewsModel.news[i].description, url: searchNewsModel.news[i].url, author: searchNewsModel.news[i].author,
         image: searchNewsModel.news[i].image, language: searchNewsModel.news[i].language,
         category: searchNewsModel.news[i].category, published: searchNewsModel.news[i].published, searchNewsId: categoryId));
   }
    (await database.select(database.searchNews).get()).forEach((element) {print('$element');});
    final uuulyalya = database.select(database.news)..where((row) => row.searchNewsId.isValue(categoryId));
    final dfdf = await uuulyalya.get();
    print(dfdf.first);

  }

  @override
  Future<SearchNewsModel> selectLastModelFromBd(Database database) async{
      final SearchNewsModel searchNewsModel;
      final searchNewsTable = await database.select(database.searchNews).get();
      final lastRow = searchNewsTable.last;
      final maxId = lastRow.id;
      final rowSearchNewsWithMaxId = database.select(database.searchNews)..where((row) => row.id.isValue(maxId));
      final rowNewsWithMaxIdOfSearchNews = database.select(database.news)..where((rows) => rows.searchNewsId.isValue(maxId));
      final row = await rowSearchNewsWithMaxId.get();
      final newRow = row[0];
      final List<NewsModel> newsModelList = [];
      for(final row in await rowNewsWithMaxIdOfSearchNews.get()){
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
      searchNewsModel = SearchNewsModel(status: newRow.status,news: newsModelList, page: newRow.page);
      return searchNewsModel;
    }

  @override // (1)54  ,   (2)59
  Future<SearchNewsModel> selectPreLastModelFromBd(Database database) async{
    final searchNewsTable = await database.select(database.searchNews).get();
    final length = searchNewsTable.length;
    if(length==1){
      return await selectLastModelFromBd(database);
    } else if(length==0){
      throw UnimplementedError();
    }else if(length<1){
      final SearchNewsModel searchNewsModel;
      final preLast = length-1;
      final preLastRow = searchNewsTable[preLast];
      final preLastId = preLastRow.id;
      final rowSearchNewsWithPreLastId = database.select(database.searchNews)..where((row) => row.id.isValue(preLastId));
      final rowNewsWithPreLastOfSearchNews = database.select(database.news)..where((rows) => rows.searchNewsId.isValue(preLastId));
      final rowSearchNews = await rowSearchNewsWithPreLastId.get();
      final rowSearchNewsNotList = rowSearchNews[0];
      final List<NewsModel> newsModelList = [];
      for(final row in await rowNewsWithPreLastOfSearchNews.get()){
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
      searchNewsModel = SearchNewsModel(status: rowSearchNewsNotList.status, news: newsModelList, page: rowSearchNewsNotList.page);
      return searchNewsModel;
    }else{
      throw UnimplementedError();
    }
  }

  @override
  Future<int> lenghtOfSearchNewsFromDb(Database database) async{
    final searchNewsTable = await database.select(database.searchNews).get();
    return searchNewsTable.length;
  }





  }



