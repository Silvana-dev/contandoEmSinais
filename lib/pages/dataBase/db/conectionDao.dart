// ignore_for_file: unnecessary_null_comparison

import 'package:flutter_application_sinais/domain/usuarios.dart';
import 'package:flutter_application_sinais/pages/dataBase/dateBase.dart';
import 'package:sqflite/sqflite.dart';

class PacoteDao {
  String $tableN = 'cliente';

  List<Clientes> lista = [];

  Future<List<Clientes>> loginApp(
    String email,
    String senha,
  ) async {
    assert(email != null);
    assert(senha != null);
    Database database = await DatabaseHelper().db;

    String sql =
        'SELECT email, senha FROM cliente WHERE email = $email; AND senha = $senha';

    final result = await database.rawQuery(sql);

    for (var json in result) {
      Clientes cliente = Clientes.fromJson(json);
      lista.add(cliente);
    }
    return lista;
  }

  criarClienteDao(String nome, String photo, String email, String senha) async {
    Database database = await DatabaseHelper().db;

    String sql =
        "INSERT INTO cliente (email, photo, nome, senha) VALUES($email, $photo, $nome, $senha);";

    await database.execute(sql);
  }
}
