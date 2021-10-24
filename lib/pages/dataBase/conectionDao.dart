import 'package:flutter_application_sinais/pages/class/client.dart';
import 'package:flutter_application_sinais/pages/dataBase/dateBase.dart';
import 'package:sqflite/sqflite.dart';

class PacoteDao {
  List<Client> lista = [];

  Future<List<Client>> loginApp(String email) async {
    Database database = await DatabaseHelper().db;

    String sql = 'SELECT email, senha FROM package WHERE email = $email;';

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
        "INSERT INTO package (email, photo, nome, senha) VALUES($email, $photo, $nome, $senha);";

    await database.execute(sql);
  }
}
