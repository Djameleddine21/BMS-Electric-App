import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../constants.dart';

class HomePage extends StatelessWidget {
  static const String id = '/home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.person_add_alt_1),
        ),
        body: Stack(
          children: [
            SizedBox.expand(
              child: GoogleMap(
                zoomControlsEnabled: false,
                initialCameraPosition:
                    CameraPosition(target: LatLng(36.4, 3.2), zoom: 10.0),
              ),
            ),
            Positioned(
              top: 32,
              right: 16,
              left: 16,
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  style: TextStyle(color: primaryColor),
                  decoration: inputDecoration.copyWith(
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[700],
                      size: 32,
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
