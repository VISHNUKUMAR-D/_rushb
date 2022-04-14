import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong/latlong.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class map extends StatefulWidget {
  const map({Key? key}) : super(key: key);

  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<map> {
  var _currentPosition;
  LatLng point = LatLng(11.020000, 76.936370);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
          children: [
            FlutterMap(
                options: MapOptions(
                    onTap: (p) {
                      setState(() {
                        point = p;
                      });
                    },
                    center: point,
                    zoom: 12.5),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayerOptions(markers: [
                    Marker(
                        width: size.width * 0.2,
                        height: size.width * 0.2,
                        point: point,
                        builder: (ct) => Icon(Icons.location_on,
                            color: Colors.blue, size: size.width * 0.075))
                  ])
                ]),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              getCurrentLocation();
              setState(() {
                if (_currentPosition != null) {
                  print(_currentPosition.latitude.toString() +
                      " " +
                      _currentPosition.longitude.toString());
                  point = LatLng(
                      _currentPosition.latitude, _currentPosition.longitude);
                }
              });
            },
            backgroundColor: Colors.greenAccent.shade700,
            label: Icon(Icons.location_searching_rounded)));
  }

  getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }
}
