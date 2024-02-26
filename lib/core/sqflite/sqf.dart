import 'package:meals_app/features/meal/data/models/meal_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDB {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'meals.db');
    Database myDb = await openDatabase(path,
        onCreate: _onCreate, version: 2, onUpgrade: _onUpgrade);
    return myDb;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print("on upgrade");
    // await db.execute("ALTER TABLE meals ADD COLUMN");
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE meals (
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      strMeal TEXT NOT NULL,
      strMealThumb BLOB NOT NULL,
      idMeal TEXT NOT NULL 
    )
  ''');
    print("on create");
  }

  Future<List<MealModel>> readData(String table) async {
    Database? myDb = await db;
    List<Map<String, dynamic>> response = await myDb!.query(table);
    return response.map((e) => MealModel.fromJson(e)).toList();
  }

  insertData(String table, Map<String, Object?> values) async {
    Database? myDb = await db;
    int response = await myDb!.insert(table, values);
    return response;
  }

  Future<int> deleteData(String table, String mealId) async {
    Database? myDb = await db;
    int response = await myDb!.delete(table, where: 'idMeal = "$mealId"');
    return response;
  }

  myDeleteDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'meals.db');
    await deleteDatabase(path);
  }
}
