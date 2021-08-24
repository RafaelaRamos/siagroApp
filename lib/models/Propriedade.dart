import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Propriedade {
  final String id;
  final String nome;
  final String proprietario;
  final String contato;
  final String telefone;
  final List<LatLng> poligono;

  const Propriedade(
      {@required this.id,
      @required this.nome,
      @required this.proprietario,
      @required this.contato,
      @required this.telefone,
      @required this.poligono});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'nome': nome,
      'proprietário': proprietario,
      'contato': contato,
      'telefone': telefone,
      'poligono': poligono
    };
    return map;
  }
}
