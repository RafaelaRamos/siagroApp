import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:siagro/Convert.dart';
import 'package:siagro/models/Propriedade.dart';

class ShowPropriedade extends StatefulWidget {
  final Propriedade _propriedade;
  //final String teste;
  const ShowPropriedade(this._propriedade);

  @override
  _ShowPropriedadeState createState() => new _ShowPropriedadeState();
}

class _ShowPropriedadeState extends State<ShowPropriedade> {
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};
  GoogleMapController controller;
  List<LatLng> latlngSegment1 = [];
  LatLng _lastMapPosition;
  @override
  void initState() {
    super.initState();
    getPoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        //that needs a list<Polyline>
        polylines: _polyline,
        markers: _markers,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _lastMapPosition,
          zoom: 16,
        ),
        mapType: MapType.normal,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controllerParam) {
    setState(() {
      controller = controllerParam;
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        //_lastMapPosition is any coordinate which should be your default
        //position when map opens up
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: widget._propriedade.nome,
          //widget._modulo.nome,
        ),
      ));

      _polyline.add(Polyline(
        polylineId: PolylineId('line'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment1,
        width: 4,
        color: Colors.green,
      ));
    });
  }

  getPoints() {
    List<LatLng> points =
        convertPointsLatLng(widget._propriedade.lat, widget._propriedade.lng);

    setState(() {
      latlngSegment1 = points;
      _lastMapPosition = points[1];
    });

    print(latlngSegment1);
  }
}
