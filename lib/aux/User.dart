import 'dart:convert';


class LoginData{
  bool success;
  String message;
  User data;

  LoginData({this.success, this.message, this.data});

  factory LoginData.fromJson(Map<String, dynamic> parsedJson){
    return LoginData(
        success: parsedJson['success'],
        message : parsedJson['message'],
        data :  User.fromJson(parsedJson ['data'])
    );
  }
}

class User {

  String person_name;
  String provider_folio;
  String initial_date;
  String final_date;
  String cover;
  String lat;
  String long;
  String address;

  User({this.person_name,this.provider_folio,this.initial_date,this.final_date,this.cover,this.lat,this.long,this.address});

  factory User.fromJson(Map<String, dynamic> parsedJson){
    return User(
      person_name:parsedJson['pro']['person_name'],
      provider_folio:parsedJson['pro']['proveedor_folio'],
      initial_date:parsedJson['pro']['initial_date'],
      final_date:parsedJson['pro']['final_date'],
      cover:parsedJson['pro']['cover'],
      lat:parsedJson['pro']['lat'],
      long:parsedJson['pro']['long'],
      address:parsedJson['pro']['ubicacion'],
    );
  }

}

class HistoryData{
  bool success;
  String message;
  HistoryInfo data;

  HistoryData({this.success, this.message, this.data});

  factory HistoryData.fromJson(Map<String, dynamic> parsedJson){

    return HistoryData(
        success: parsedJson['success'],
        message : parsedJson['message'],
        data : HistoryInfo.fromJson(parsedJson['data'])
    );
  }
}
class HistoryInfo{

  List<Confirmados> confir;
  List<Cancelados> cancel;


  HistoryInfo({this.confir, this.cancel});

  factory HistoryInfo.fromJson(Map<String, dynamic> parsedJson){


    print(parsedJson['cancelados'].length);


    var list = parsedJson['Confirmados'].length > 0? Map.from(parsedJson['Confirmados']).values.toList() : [];

    var list2 = parsedJson['cancelados'].length > 0? Map.from(parsedJson['cancelados']).values.toList(): [];
    print("hi2");

    return HistoryInfo(
        confir: list.map((i)=>Confirmados.fromJson(i)).toList(),
        cancel : list2.map((i)=>Cancelados.fromJson(i)).toList()
    );
  }
}

class Confirmados {


  int request_id;
  int service_id;
  String client_folio;
  String status;
  String event_date;
  String name;
  String address;


  Confirmados({this.request_id,this.service_id,this.client_folio,this.status,this.event_date,this.name,this.address});

  factory Confirmados.fromJson(Map<String, dynamic> parsedJson){

    return Confirmados(
        request_id:parsedJson['request_id'],
        service_id:parsedJson['service_id'],
        client_folio:parsedJson['client_folio'],
        status:parsedJson['status'],
        event_date:parsedJson['event_date'],
        name:parsedJson['name'],
        address:parsedJson['address']
    );
  }

}

class Cancelados {

  int request_id;
  int service_id;
  String client_folio;
  String status;
  String event_date;
  String name;
  String address;


  Cancelados({this.request_id,this.service_id,this.client_folio,this.status,this.event_date,this.name,this.address});

  factory Cancelados.fromJson(Map<String, dynamic> parsedJson){
    return Cancelados(
        request_id:parsedJson['request_id'],
        service_id:parsedJson['service_id'],
        client_folio:parsedJson['client_folio'],
        status:parsedJson['status'],
        event_date:parsedJson['event_date'],
        name:parsedJson['name'],
        address:parsedJson['address']
    );
  }


}

class RequestData{
  bool success;
  String message;
  List<dynamic> data;

  RequestData({this.success, this.message, this.data});


  factory RequestData.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['data']['solicitudes'].values;
     var aux = list.map((i)=>RequestInfo.fromJson(i)).toList();

    return RequestData(
        success: parsedJson['success'],
        message : parsedJson['message'],
        data : aux
    );
  }
}

class RequestInfo{

  String request_id;
  String service_id;
  String client_folio;
  String status;
  String event_date;
  String name;
  String address;
  String cover;
  String total;
  Map<String,dynamic> participants;


  RequestInfo({this.request_id,this.service_id,this.client_folio,this.status,this.event_date,this.name,this.address,this.cover,this.total,this.participants});

  factory RequestInfo.fromJson(Map<String, dynamic> parsedJson){
    print(parsedJson);
    return RequestInfo(
        request_id:parsedJson['request_id'].toString(),
        service_id:parsedJson['service_id'].toString(),
        client_folio:parsedJson['client_folio'],
        status:parsedJson['status'],
        event_date:parsedJson['event_date'],
        name:parsedJson['name'],
        address:parsedJson['address'],
        cover:parsedJson['cover'].toString(),
        total:parsedJson['total'].toString(),
        participants:jsonDecode(parsedJson['participants'])
    );
  }

}

class ServiceData{
  bool success;
  String message;
  List<ServiceInfo> data;

  ServiceData({this.success, this.message, this.data});


  factory ServiceData.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['data']['servicios'] as List;

    return ServiceData(
        success: parsedJson['success'],
        message : parsedJson['message'],
        data : list.map((i)=>ServiceInfo.fromJson(i)).toList()
    );
  }
}

class ServiceInfo{

  int service_id;
  String name;
  String type;
  String cover;
  String payment_method;
  String address;
  String lat;
  String long;
  String description;

  ServiceInfo({this.service_id,this.name,this.type,this.cover,this.payment_method,this.address,this.lat,this.long,this.description});

  factory ServiceInfo.fromJson(Map<String, dynamic> parsedJson){
    return ServiceInfo(
      service_id:parsedJson['service_id'],
      name:parsedJson['name'],
      type:parsedJson['type'],
      cover:parsedJson['cover'],
      payment_method:parsedJson['payment_method'],
      address:parsedJson['address'],
      lat:parsedJson['lat'],
      long:parsedJson['long'],
      description:parsedJson['description'],

    );
  }

}


class ServiceDetail{
  bool success;
  String message;
  ServiceDetailInfo data;

  ServiceDetail({this.success, this.message, this.data});


  factory ServiceDetail.fromJson(Map<String, dynamic> parsedJson){
    return ServiceDetail(
        success: parsedJson['success'],
        message : parsedJson['message'],
        data : ServiceDetailInfo.fromJson(parsedJson['data'])
    );
  }
}

class ServiceDetailInfo{
  Serv service;
  List<Notas> notes;
  List<Slides> car;
  ServiceDetailInfo({this.service,this.car,this.notes});

  factory ServiceDetailInfo.fromJson(Map<String, dynamic> parsedJson){

    var slides = parsedJson['car'] as List;
    var notas = parsedJson['notas'] as List;


    return ServiceDetailInfo(
      service:  Serv.fromJson(parsedJson['servicio']),
      car: slides.map((i)=>Slides.fromJson(i)).toList(),
      notes:notas.map((i)=>Notas.fromJson(i)).toList(),
    );
  }

}

class Serv{
  int service_id;
  String name;
  cotizacion type;
  String cover;
  String payment_method;
  String address;
  String lat;
  String long;
  String description;

  Serv({this.service_id, this.name, this.type, this.cover, this.payment_method, this.address, this.lat, this.long, this.description});

  factory Serv.fromJson(Map<String, dynamic> parsedJson){

    return Serv(
        service_id: parsedJson['service_id'],
        name : parsedJson['name'],
        type: cotizacion.fromJson(json.decode(parsedJson['type'])),
        cover : parsedJson['cover'],
        payment_method: parsedJson['payment_method'],
        address : parsedJson['address'],
        lat: parsedJson['lat'],
        long : parsedJson['long'],
        description: parsedJson['description']
    );
  }
}

class Notas{
  String name;
  String description;

  Notas({this.name, this.description});

  factory Notas.fromJson(Map<String, dynamic> parsedJson){
    return Notas(
      name: parsedJson['name'],
      description : parsedJson['description'],
    );
  }
}

class Slides{
  String name;
  String cover;

  Slides({this.name, this.cover});

  factory Slides.fromJson(Map<String, dynamic> parsedJson){
    return Slides(
      name: parsedJson['title'],
      cover : parsedJson['cover'],
    );
  }
}

class cotizacion{
  String tipo;
  List<dynamic> precios;

  cotizacion({this.tipo, this.precios});

  factory cotizacion.fromJson(Map<String, dynamic> parsedJson){
    var prices = parsedJson['precio'] as List;
    return cotizacion(
      tipo:parsedJson['tipo'],
      precios : prices,
    );
  }
}

