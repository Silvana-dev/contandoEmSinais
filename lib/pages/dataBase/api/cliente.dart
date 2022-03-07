import 'package: http/http.dart' as http;

class ClientApi{

  final string _baseurl = 'https://urldaapiaqui';
  final map<String, String> headers = { 'Content_type': 'application/json'};


  getCliente(){
    Uri url = Uri.https(_baseUrl, '/api/findAll');
    var response = await http.get(url, headers: headers);

    List<Cliente> lista = <Cliente>[];
    if(response.statusCode == 200){
      List <dynamic> decodeResponse = await json.decode(response.body);
      for (var json in decodeResponse){
        Cliente cliente = Cliente.fromJson(element);
        lista.add(cliente);
      }
    }
    return lista;
  }
}