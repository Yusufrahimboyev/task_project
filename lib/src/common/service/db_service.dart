import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbService {
  final Database db;

  // 1. Privat constructor (tashqaridan DbService() deb chaqirib bo'lmaydi)
  DbService._(this.db);

  // 2. Bazani ishga tushirish uchun static metod
  static Future<DbService> initialize() async {
    // Bazaning telefondagi manzili
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'time_trigger.db');

    // Bazani ochish
    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Jadvallarni yaratish (Masalan, tasks jadvali)
        await db.execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, startTime TEXT, isCompleted INTEGER)',
        );
      },
    );

    // DbService obyektini qaytarish
    return DbService._(database);
  }
}