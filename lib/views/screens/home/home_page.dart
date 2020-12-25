import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatelessWidget {
  static const String id = '/home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox.expand(
          child: GoogleMap(
            initialCameraPosition: CameraPosition(target: LatLng(36.4, 3.2), zoom: 8.0),
            onMapCreated: (_) {},
          ),
        ),
      ),
    );
  }
}
