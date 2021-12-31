import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class DatabaseHelper {
  late Database db_;

  Future<Database> get db async {
    db_ = await _initDB();
    return db_;
  }

  _initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'contando-sinais');
    print(path);

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );
    return database;
  }

  onCreate(Database db, int version) async {
    String sql = 'create table cliente'
        '(email varchar(100) PRIMARY KEY, photo varchar(100), nome varchar(100), senha varchar(100));';
    await db.execute(sql);

    sql =
        " INSERT INTO cliente (email,photo,nome,senha) VALUES(name@gmail.com, assets/profile-picture.png, usuario, 1234);";
    await db.execute(sql);
  }
}
