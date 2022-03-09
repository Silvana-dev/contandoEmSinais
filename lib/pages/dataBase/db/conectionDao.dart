import 'package:flutter_application_sinais/pages/class/client.dart' show Client;
import 'package:flutter_application_sinais/pages/dataBase/db/dateBase.dart';
import 'package:sqflite/sqflite.dart';

class PacoteDao {
  String $tableN = 'cliente';

  List<Client> lista = [];

  Future<List<Client>> loginApp(
      {required String email, required String senha}) async {
    Database database = await DatabaseHelper().db;

    String sql =
        'SELECT email, senha FROM cliente WHERE email = $email; AND senha = $senha';

    final result = await database.rawQuery(sql);

    for (var json in result) {
      Client cliente = Client.fromJson(json);
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
