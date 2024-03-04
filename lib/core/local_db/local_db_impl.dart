import 'package:retrofit_moment/core/local_db/local_db.dart';
import 'package:sqflite/sqflite.dart';

class LocalDBImpl implements LocalDB{
  @override
  Future<Database> openDB() async{
    final databasesPath = await getDatabasesPath();
    String path = '${databasesPath}demo.db';
    final db = await openDatabase(path);
    return db;
  }

  @override
  void createTable() {
    // TODO: implement createTable
  }

  @override
  void deleteFromDB() {
    // TODO: implement deleteFromDB
  }

  @override
  Future<int> insertToDB(Database db, String tableName, Map<String,Object?> mapValues) async{
    final code = await db.insert(tableName, mapValues);
    return code;
  }

  @override
  void queryTable() {
    // TODO: implement queryTable
  }

  @override
  Future<void> closeDB(Database db) async{
    await db.close();
  }
}