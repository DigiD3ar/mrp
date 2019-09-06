import 'package:http/http.dart' as http;
import 'dart:convert';

class Dal {


  login(String password) async{
    var url ='http://clientes.locker.com.mx/mrback/public/api/proveedor/login';
    var payload = {"provider_folio":password};
    final response = await http.post(url, body:payload);

    if (response.statusCode == 200) {
//      return LoginUsuarios.fromJson(json.decode(response.body));

      return response;

    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  catalog(String id) async{
    var url ='http://clientes.locker.com.mx/mrback/public/api/category/'+id;
    final response = await http.get(url);

    if (response.statusCode == 200) {
//      return LoginUsuarios.fromJson();

      return response;

    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<bool> solicitud(Map<dynamic,dynamic>  data) async{
    var url ='http://clientes.locker.com.mx/mrback/public/api/request';
    final response = await http.post(url, body:data);

    print(response.body);
    if (response.statusCode == 200) {

      return true;

    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  acceptRequest(String id) async{
    var url ='http://clientes.locker.com.mx/mrback/public/api/proveedor/request/${id}/confirm';
    final response = await http.post(url);

    if (response.statusCode == 200) {
//      return LoginUsuarios.fromJson(json.decode(response.body));

      return json.decode(response.body);

    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<Map> offerDates(id,data) async {
    print(data);
    var url ='http://clientes.locker.com.mx/mrback/public/api/proveedor/request/${id}';
    final response = await http.post(url, body:{"date_options":data});

    print(response.body);
    if (response.statusCode == 200) {

      return json.decode(response.body);

    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

}