import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:flutter_application_sinais/pages/class/client.dart';

class ClientApi {
  final String _baseurl = 'https://urldaapiaqui';
  final Map<String, String> headers = {'Content_type': 'application/json'};

  getCliente() async {
    Uri url = Uri.https(_baseurl, '/api/findAll');
    var response = await http.get(url, headers: headers);

    List<Client> lista = <Client>[];
    if (response.statusCode == 200) {
      List<dynamic> decodeResponse = await json.decode(response.body);
      for (var json in decodeResponse) {
        Client cliente = Client.fromJson(json);
        lista.add(cliente);
      }
    }
    return lista;
  }
}
