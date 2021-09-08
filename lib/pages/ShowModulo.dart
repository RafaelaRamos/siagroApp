import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:siagro/models/Modulo.dart';

class ShowModulo extends StatefulWidget {
  final Modulo modulo;

  ShowModulo({Key key, @required this.modulo}) : super(key: key);

  @override
  _ShowModuloState createState() => _ShowModuloState();
}

class _ShowModuloState extends State<ShowModulo> {
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  GoogleMapController controller;

  List<LatLng> latlngSegment1 = List();
  LatLng _lastMapPosition;

  @override
  void initState() {
    super.initState();
    //line segment 1
    //latlngSegment1 = widget.modulo.poligono;
    //_lastMapPosition = widget.modulo.poligono[0];
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
          zoom: 11.0,
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
          title: 'Awesome Polyline tutorial',
          snippet: 'This is a snippet',
        ),
      ));

      _polyline.add(Polyline(
        polylineId: PolylineId('line1'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment1,
        width: 2,
        color: Colors.green,
      ));

      //different sections of polyline can have different colors
    });
  }

  convertPoints() {}
}
