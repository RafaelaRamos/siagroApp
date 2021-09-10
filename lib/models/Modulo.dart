import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Modulo {
  int id;
  String nome;
  String lat;
  String lng;

  Modulo({@required this.id, @required this.nome, this.lat, this.lng});

  Modulo.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.nome = map['nome'];
    this.lat = map['lat'];
    this.lng = map['lng'];
  }
  Modulo.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        nome = res["nome"],
        lat = res["lat"],
        lng = res["lng"];
  // poligono = res['poligono'];*/

  Map<String, Object> toMap() {
    var map = <String, Object>{'id': id, 'nome': nome, 'lat': lat, 'lng': lng};
    return map;
  }

  Modulo.fromJson(Map json)
      : id = json['id'],
        nome = json['nome'],
        lat = json['lat'],
        lng = json['lng'];

  Map toJson() {
    return {'id': id, 'nome': nome, 'lat': lat, 'lng': lng};
  }
}
