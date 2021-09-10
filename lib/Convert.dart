import 'package:google_maps_flutter/google_maps_flutter.dart';

//Converte pontos de latitude em string
String convertPointsLat(List<LatLng> poligono) {
  var lat = <double>[];
  for (var i = 0; i < poligono.length; i++) {
    lat.add(poligono[i].latitude.toDouble());
  }

  return lat.toString();
}

//converte pontos de longitude em string

String convertPointsLng(List<LatLng> poligono) {
  var lng = <double>[];
  for (var i = 0; i < poligono.length; i++) {
    lng.add(poligono[i].longitude.toDouble());
  }
  return lng.toString();
}

//transforma lat e lng em string em uma lista de LatLong
convertPointsLatLng(String latitude, String longitude) {
  //pegando array de strings
  var lat = latitude.split(',');
  var lng = longitude.split(',');
  print(latitude);

  //tratando as strings para transformar em double
  var latfist = remColchetefirst(lat.first);
  var lngfist = remColchetefirst(lng.first);
  var lnglast = remColchetelast(lng.last);
  var latlast = remColchetelast(lat.last);
  lat.first = latfist;
  lng.first = lngfist;
  lng.last = lnglast;
  lat.last = latlast;

  List<LatLng> points = [];
  double lati;
  double long;
  LatLng point;
  for (var i = 0; i < lng.length; i++) {
    lati = double.parse(lat[i]);
    long = double.parse(lng[i]);
    point = LatLng(lati, long);
    points.add(point);
  }
  LatLng teste = points[0];
  points.add(teste);

  print(points);
  return points;
}

//remove colchetes do inicio
remColchetefirst(String remover) {
  var rem = remover.split('[');
  return rem[1];
}

//remove colchetes do final
remColchetelast(String remover) {
  var rem = remover.split(']');
  return rem[0];
}
