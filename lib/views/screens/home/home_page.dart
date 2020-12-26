import 'package:bms_electric/models/resseler/reseller.dart';
import 'package:bms_electric/services/location.dart';
import 'package:bms_electric/services/manager.dart';
import 'package:bms_electric/views/bloc/resellers_cubit.dart';
import 'package:bms_electric/views/screens/add_reseller/add_reseller_page.dart';
import 'package:bms_electric/views/screens/reseller_profile/reseller_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../constants.dart';

class HomePage extends StatefulWidget {
  static const String id = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BitmapDescriptor icon;
  @override
  void initState() {
    super.initState();

    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(
              devicePixelRatio: 1,
              size: Size(20, 20),
            ),
            'assets/icons/marker.png')
        .then((value) => icon = value);
  }

  @override
  Widget build(BuildContext context) {
    ResellersCubit.instance.getResellers();
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigator.pushNamed(AddResellerPage.id);
          },
          child: Icon(Icons.person_add_alt_1),
        ),
        body: Stack(
          children: [
            SizedBox.expand(
              child: BlocBuilder<ResellersCubit, List<Reseller>>(
                  cubit: ResellersCubit.instance,
                  builder: (context, data) {
                    return GoogleMap(
                      markers: Set.from(
                        List.generate(
                          data.length,
                          (index) => Marker(
                              onTap: () {
                                Manager.instance.selectedReseller = data[index];
                                navigator.pushNamed(ResellerProfilePage.id);
                              },
                              markerId: MarkerId(index.toString()),
                              position: LatLng(
                                  data[index].latitude, data[index].longitude),
                              icon: icon),
                        ),
                      ),
                      onMapCreated: LocationService.instance.onMapCreated,
                      zoomControlsEnabled: false,
                      initialCameraPosition:
                          CameraPosition(target: LatLng(36.4, 3.2), zoom: 0.0),
                    );
                  }),
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
