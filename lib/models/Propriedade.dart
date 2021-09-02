import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:siagro/models/Modulo.dart';

class Propriedade {
  final String id;
  final String nome;
  final String proprietario;
  final String contato;
  final String telefone;
  final List<LatLng> poligono;
  final List<Modulo> modulos;
  final LatLng sedePoint;

  const Propriedade(
      {@required this.id,
      @required this.nome,
      @required this.proprietario,
      @required this.contato,
      @required this.telefone,
      @required this.poligono,
      @required this.modulos,
      @required this.sedePoint});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'nome': nome,
      'proprietário': proprietario,
      'contato': contato,
      'telefone': telefone,
      'poligono': poligono,
      'modulo': modulos,
      'sedePoint': sedePoint
    };
    return map;
  }
}
