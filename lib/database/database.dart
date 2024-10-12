import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseSqlite {

  Future<Database> openConnection() async {
    final databasePath = await getDatabasesPath();
    final databaseFinalPath = join(databasePath,'SQLITE');

    return await openDatabase(databaseFinalPath, version: 1, 
    
    // quando incia o aplicativo pela primeira vez 

    onCreate: (Database db, int version){
    final batch = db.batch();

      batch.execute(
        '''CREATE TABLE IF NOT EXISTS users
        (id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR(200))''');

      batch.commit();

    },
    // chamado quando o bando sofre incremento na versão 

    onUpgrade: (Database db, int oldVersion, int newVersion){
      final batch = db.batch();

      if (oldVersion == 1){
        batch.execute(
        '''CREATE TABLE IF NOT EXISTS product
        (id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR(200))''');
      }

      batch.commit();
    },
    // chamado quando se tem um rollback da versão do banco

    onDowngrade: (Database db, int oldVersion, int newVersion) {
      final batch = db.batch();

      if (oldVersion == 2){
        batch.execute(
        '''DROP TABLE product IF EXISTS''');
      }

      batch.commit();
    },
    onConfigure: (Database db) async {
    
      await db.execute("PRAGMA foreign_keys = ON");
    },);
  }

}