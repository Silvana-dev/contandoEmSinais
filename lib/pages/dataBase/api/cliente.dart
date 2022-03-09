// ignore_for_file: unused_import

import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter_application_sinais/domain/usuarios.dart';

class ClientApi {
  final String _baseurl = 'https://urldaapiaqui.com';
  final Map<String, String> headers = {'Content_type': 'application/json'};

  getCliente() async {
    Uri url = Uri.https(_baseurl, '/api/findAll');
    var response = await http.get(url, headers: headers);

    List<Clientes> lista = <Clientes>[];
    if (response.statusCode == 200) {
      List<dynamic> decodeResponse = await json.decode(response.body);
      for (var element in decodeResponse) {
        Clientes cliente = Clientes.fromJson(element);
        lista.add(cliente);
      }
    }

    return lista;
  }
}
