// ignore_for_file: unnecessary_null_comparison

import 'package:flutter_application_sinais/pages/dataBase/db/conectionDao.dart';

class Clientes {
  late String nome;
  late String email;
  late String senha;
  late String photo;

  PacoteDao pd = PacoteDao();

  Clientes({
    required this.nome,
    required this.email,
    required this.senha,
  }) {
    throw UnimplementedError();
  }

  criarCliente(String nome, String email, String senha) async {
    this.nome = nome;
    this.email = email;
    this.senha = senha;
    if (this.email != null && this.nome != null && this.senha != null) {
      await pd.criarClienteDao(this.nome, this.photo, this.email, this.senha);
      return true;
    } else {
      return false;
    }
  }

  loginUser(String email, String senha) {
    return pd.loginApp(email, senha);
  }

  Clientes.fromJson(Map<String, dynamic> json) {
    this.email = json['email'];
    this.senha = json['senha'];
    this.nome = json['nome'];
    this.photo = json['photo'];
  }

  setPhoto(String caminho) {
    this.photo = caminho;
  }

  @override
  String toString() {
    return 'Cliente {Email: $email, Photo: $photo, Senha: $senha, Nome: $nome';
  }
}
