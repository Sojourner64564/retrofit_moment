import 'dart:convert';
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:path/path.dart' as p;
import 'package:path/path.dart';

part 'search_news_local_drift_database.g.dart';


class SearchNews extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get status => text()();
  IntColumn get page => integer()();
}

class News extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get newsId => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get url => text()();
  TextColumn get author => text()();
  TextColumn get image => text()();
  TextColumn get language => text()();
  TextColumn get category => text().map(StringListTypeConverter())();
  TextColumn get published => text()();
  IntColumn get searchNewsId => integer().references(SearchNews, #id)();
}

class StringListTypeConverter extends TypeConverter<List<String>, String> {
  @override
  List<String> fromSql(String fromDb) {
    return List<String>.from(json.decode(fromDb));
  }
  @override
  String toSql(List<String> value) {
    return json.encode(value);
  }
}

@DriftDatabase(tables: [SearchNews, News],)
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 2;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }
    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;
    return NativeDatabase.createInBackground(file);
  });
}