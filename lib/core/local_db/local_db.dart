import 'package:sqflite/sqflite.dart';

abstract class LocalDB{
  Future<Database> openDB();
  void createTable();
  Future<int> insertToDB(Database db, String tableName, Map<String,Object?> mapValues);
  void deleteFromDB();
  void queryTable();
  Future<void> closeDB(Database db);
}