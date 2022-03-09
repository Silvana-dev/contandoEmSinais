import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-9.75164, -36.6604),
    zoom: 14,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // body: GoogleMap(
        //markers: <Marker>{
        //   Marker(position: LatLng(-9.75164, -36.6604), markerId: MarkerId("1")),
        // },
        // mapType: MapType.normal,
        // initialCameraPosition: _kGooglePlex,
        // onMapCreated: (GoogleMapController controller) {
        //   _controller.complete(controller);
        //  },
        // ),
        );
  }
}
