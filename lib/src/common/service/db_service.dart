import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbService {
  final Database db;


  DbService._(this.db);


  static Future<DbService> initialize() async {

    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'weather.db');


    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {

        await db.execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, startTime TEXT, isCompleted INTEGER)',
        );
      },
    );


    return DbService._(database);
  }
}