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
    Database mydb = await openDatabase(path, onCreate: _onCreate , version:  2 , onUpgrade: _onUpgrade );
    return mydb;
  }
  _onUpgrade(Database db, int oldversion , int newversion ) async  {
    print("on upgradeeeee");
   // await db.execute("ALTER TABLE meals ADD COLUMN");

  }
  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE meals (
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      image BLOB NOT NULL
    )
  ''');
    print("on createeeee");
  }


  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.query(sql);
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
  mydeleteDatabase () async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'meals.db');
    await deleteDatabase(path);
  }
}
