import 'dart:math';
import 'package:flutter/material.dart';
import 'package:siagro/data/dummy_propriedades.dart';
import 'package:siagro/models/Propriedade.dart';

class PropriedadesProvider with ChangeNotifier {
  final Map<String, Propriedade> propriedades = {...DUMMY_PROPRIEDADES};

  List<Propriedade> get all {
    return [...propriedades.values];
  }

  int get count {
    return propriedades.length;
  }

  Propriedade byIndex(int i) {
    return propriedades.values.elementAt(i);
  }

  void remove(Propriedade propriedade) {
    print(propriedade.id);
    if (propriedade != null && propriedade.id != null) {
      propriedades.remove(propriedade.id);
      notifyListeners();
    }
  }

  void put(Propriedade propriedade) {
    if (propriedade == null) {
      return;
    }

    if (propriedade.id != null &&
        propriedade.id.trim().isNotEmpty &&
        propriedades.containsKey(propriedade.id)) {
      propriedades.update(
          propriedade.id,
          (_) => Propriedade(
              id: propriedade.id,
              nome: propriedade.nome,
              proprietario: propriedade.proprietario,
              contato: propriedade.contato,
              telefone: propriedade.telefone,
              poligono: propriedade.poligono));
    } else {
      final id = Random().nextDouble().toString();

      propriedades.putIfAbsent(
          id,
          () => Propriedade(
              id: id,
              nome: propriedade.nome,
              proprietario: propriedade.proprietario,
              contato: propriedade.contato,
              telefone: propriedade.telefone,
              poligono: propriedade.poligono));
      print(propriedade);
    }
    notifyListeners();
  }
}
