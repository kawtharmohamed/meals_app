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


  readData(String table) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.query(table);
    return response;
  }

  insertData(String table , Map < String , Object?>values ) async {
    Database? mydb = await db;
    int response = await mydb!.insert(table, values);
    return response;
  }

  deleteData(String table , String? mywhere) async {
    Database? mydb = await db;
    int response = await mydb!.delete(table , where: mywhere);
    return response;
  }
  mydeleteDatabase () async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'meals.db');
    await deleteDatabase(path);
  }
}
