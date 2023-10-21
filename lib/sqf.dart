import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDB {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'meals.db');
    Database mydb = await openDatabase(path, onCreate: _onCreate , version:  1 , onUpgrade: _onUpgrade );
    return mydb;
  }
  _onUpgrade(Database db, int oldversion , int newversion )  {
    print("on upgradeeeee");
  }
  _onCreate(Database db, int version) async {
    await db.execute('''
   Create Table "meals"(
   "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
   "meal" TEXT NOT NULL
  )
     ''');
    print("on createeeee");
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
