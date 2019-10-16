import 'package:http/http.dart' as http;
import 'package:merida_rentals_provider/aux/User.dart';
import 'dart:convert';

class Dal {


  Future<LoginData>login(String password,String token) async{
    var url ='http://clientes.locker.com.mx/mrback/public/api/proveedor/login';
    var payload = {"provider_folio":password,"token":token};
    print(payload);
    final response = await http.post(url, body:payload);

    if (response.statusCode == 200) {
      return LoginData.fromJson(json.decode(response.body));

    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<RequestData>catalog(String id) async{
    var url ='http://clientes.locker.com.mx/mrback/public/api/proveedor/solicitudes';
    var payload ={"provider_folio":id};
    final response = await http.post(url,body:payload);
    if (response.statusCode == 200) {
      return RequestData.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<HistoryData> Historial(String id) async{
    var url ='http://clientes.locker.com.mx/mrback/public/api/proveedor/history/${id}';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return HistoryData.fromJson(json.decode(response.body));
    } else {
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
    final response = await http.get(url);

    if (response.statusCode == 200) {
//      return LoginUsuarios.fromJson(json.decode(response.body));
      print(json.decode(response.body)['data']);
      return json.decode(response.body);

    } else {
      // If that response was not OK, throw an error.
      throw Exception("error");
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