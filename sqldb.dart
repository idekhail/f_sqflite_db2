import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'json/users.dart';

class SqlDb{

  final databaseName = "userdb2.db";

 // Table
  String user = '''
    CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT,
      password TEXT
    )
    ''';
  Future<Database> intialDb() async {
    final databasepath = await getDatabasesPath();
    final path = join(databasepath, databaseName);
    return openDatabase(path, version: 1, onCreate: (db, version)async{
      await db.execute(user);
    });
  }

  Future<Users> loginUser(Users usr) async{
    final Database db = await intialDb();
    final result = await db.rawQuery(
        "select * from users where username = '${usr.username}' AND password = '${usr.password}'");
    if (result.isNotEmpty) {
      return Users.fromMap(result.first);
    } else {
      throw Exception("usernam or password not found");
    }
  }

  Future<int> createUser(Users usr) async{
    final Database db = await intialDb();
    return db.rawInsert("INSERT INTO 'users' ('username', 'password') VALUES ('${usr.username}', '${usr.password}')");
  }

  Future<int> deleteUser(Users usr) async{
    final Database db = await intialDb();
    return await db.rawDelete('DELETE FROM users where id =?',['${usr.id}']);
  }

  Future<int> updateUser(Users usr) async{
    final Database db = await intialDb();
    return await db.rawUpdate(
      "UPDATE users SET username = \'${usr.username}\', password = \'${usr.password} WHERE id = ${usr.id}'"
    );
  }

  // A method that retrieves all the users from the users table.
  Future<List<Users>> getAllUsers() async {
    final Database db = await intialDb();
    List<Map> list = await db.rawQuery('SELECT * FROM users');
    return list.map((usr) => Users.fromMap(usr as Map<String, dynamic>)).toList();
  }
}
