import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



import 'package:siagro/pages/GetMapPolymaker.dart';class GetMaps extends StatefulWidget {
  @override
  _GetMapsState createState() => _GetMapsState();
}

class _GetMapsState extends State<GetMaps> {

  GoogleMapController mapController;
  double lat = -6.88634;
  double long = -38.5614;
  GetPolymakerMaps getPolymakerMaps;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Selecione a localização',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        body: GoogleMap(
        
          initialCameraPosition: CameraPosition(
            target: (LatLng(lat, long)),
            
            zoom: 11.0,
          ),
        ));
  }
}
