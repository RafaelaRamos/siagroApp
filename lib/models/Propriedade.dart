import 'package:flutter/material.dart';

class Propriedade {
  final int id;
  final String nome;
  final String proprietario;
  final String contato;
  final String telefone;
  final String lat;
  final String lng;
  final String sede;
  //final List<LatLng> poligono;
  //final List<Modulo> modulos;
  //final LatLng sedePoint;

  const Propriedade(
      {@required this.id,
      @required this.nome,
      @required this.proprietario,
      @required this.contato,
      @required this.telefone,
      @required this.lat,
      @required this.lng,
      @required this.sede

      // @required this.poligono,
      // @required this.modulos,
      //  @required this.sedePoint]
      });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'nome': nome,
      'proprietário': proprietario,
      'contato': contato,
      'telefone': telefone,
      'lat': lat,
      'sede': sede,
      //'poligono': poligono,
      //'modulo': modulos,
      //'sedePoint': sedePoint
    };
    return map;
  }

  Propriedade.fromJson(Map json)
      : id = json['id'],
        nome = json['nome'],
        proprietario = json['proprietario'],
        contato = json['contato'],
        telefone = json['telefone'],
        lat = json['lat'],
        lng = json['lng'],
        sede = json['sede'];

  Map toJson() {
    return {
      'id': id,
      'nome': nome,
      'proprietario': proprietario,
      'contato': contato,
      'telefone': telefone,
      'lat': lat,
      'sede': sede
    };
  }
}
