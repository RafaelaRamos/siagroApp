import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Modulo {
  int id;
  String nome;
  String poligono;

  Modulo({@required this.id, @required this.nome, this.poligono});

  Modulo.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.nome = map['nome'];
    this.poligono = map['poligono'];
  }
  Modulo.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        nome = res["nome"],
        poligono = res["poligono"];
  // poligono = res['poligono'];*/

  Map<String, Object> toMap() {
    var map = <String, Object>{'id': id, 'nome': nome, 'poligono': poligono};
    return map;
  }

  Modulo.fromJson(Map json)
      : id = json['id'],
        nome = json['nome'],
        poligono = json['poligono'];

  Map toJson() {
    return {'id': id, 'nome': nome, 'poligono': poligono};
  }
}
