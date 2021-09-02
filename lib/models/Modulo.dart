import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Modulo {
  int id;
  String nome;
  // final List<LatLng> poligono;

  Modulo({@required this.id, @required this.nome});

  Modulo.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.nome = map['nome'];
  }
  Modulo.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        nome = res["nome"];
  // poligono = res['poligono'];*/

  Map<String, Object> toMap() {
    var map = <String, Object>{'id': id, 'nome': nome};
    return map;
  }
}
