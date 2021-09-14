import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetMap extends StatefulWidget {
  LatLng points;
  @override
  _GetMapState createState() => _GetMapState();

  GetMap({this.points});
}

class _GetMapState extends State<GetMap> {
  List<Marker> marker = [];
  LatLng tapPoint;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Propriedades',
                style: TextStyle(fontWeight: FontWeight.bold)),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.save_outlined),
                onPressed: () => {getPoint()},
              ),
            ]),
        body: GoogleMap(
          initialCameraPosition:
              (CameraPosition(target: LatLng(-6.88634, -38.5614), zoom: 14)),
          markers: Set.from(marker),
          onTap: _handTap,
        ));
  }

  _handTap(tapPoint) {
    setState(() {
      widget.points = tapPoint;
      marker = [];
      marker.add((Marker(
        markerId: MarkerId(tapPoint.toString()),
        position: tapPoint,
      )));
    });
  }

  getPoint() {
    LatLng points = widget.points;

    Navigator.pop(context, points);
  }
}
