import 'package:flutter/material.dart';

class Modulo {
  int id;
  String nome;
  String lat;
  String lng;
  int idPropriedade;
  Modulo(
      {@required this.id,
      @required this.nome,
      this.lat,
      this.lng,
      this.idPropriedade});

  Modulo.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.nome = map['nome'];
    this.lat = map['lat'];
    this.lng = map['lng'];
    this.idPropriedade = map['idPropriedade'];
  }
  Modulo.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        nome = res["nome"],
        lat = res["lat"],
        lng = res["lng"],
        idPropriedade = res["idPropriedade"];
  // poligono = res['poligono'];*/

  Map<String, Object> toMap() {
    var map = <String, Object>{
      'id': id,
      'nome': nome,
      'lat': lat,
      'lng': lng,
      'idPropriedade': idPropriedade
    };
    return map;
  }

  Modulo.fromJson(Map json)
      : id = json['id'],
        nome = json['nome'],
        lat = json['lat'],
        lng = json['lng'],
        idPropriedade = json['idPropriedade'];

  Map toJson() {
    return {
      'id': id,
      'nome': nome,
      'lat': lat,
      'lng': lng,
      'idPropriedade': idPropriedade
    };
  }
}
