import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:polymaker/core/models/trackingmode.dart';
import 'package:polymaker/polymaker.dart' as polymaker;

class GetPolymakerMaps extends StatefulWidget {
  @override
  _GetPolymakerMapsState createState() => _GetPolymakerMapsState();
}

class _GetPolymakerMapsState extends State<GetPolymakerMaps> {
  List<LatLng> locationList;
  void getLocation() async {
    var result = await polymaker.getLocation(context,
        targetCameraPosition: LatLng(-6.88634, -38.5614),
        trackingMode: TrackingMode.PLANAR,
        enableDragMarker: true);
    if (result != null) {
      setState(() {
        locationList = result;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    locationList = [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Location Result: \n" +
                (locationList != null
                    ? locationList
                        .map((val) => "[${val.latitude}, ${val.longitude}]\n")
                        .toString()
                    : ""),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          Container(
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () => getLocation(),
              child: Text(
                "Get Polygon Location",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
