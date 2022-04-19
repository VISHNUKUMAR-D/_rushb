import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class map extends StatefulWidget {
  const map({Key? key}) : super(key: key);

  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<map> {
  static const _intialCameraPosition =
      CameraPosition(target: LatLng(11.020000, 76.936370), zoom: 15);
  late GoogleMapController _googleMapController;
  Set<Marker> markers = {
    const Marker(
      markerId: MarkerId("ID-1"),
      position: LatLng(11.020000, 76.936370),
    )
  };

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: markers,
        myLocationEnabled: true,
        zoomControlsEnabled: true,
        initialCameraPosition: _intialCameraPosition,
        onMapCreated: (controller) => _googleMapController = controller,
      ),
    );
  }
}
// Future<Position> _determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     return Future.error("Location Service Disabled");
//   }
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return Future.error("Location permission denied");
//     }
//   }
//   if (permission == LocationPermission.deniedForever) {
//     return Future.error("Location permission are deined Forever");
//   }
//   Position position = await Geolocator.getCurrentPosition();
//   return position;
// }
