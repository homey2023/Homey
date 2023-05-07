import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MainMap extends StatelessWidget {
  MainMap({super.key, this.currentLocation});

  LocationData? currentLocation;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          height: constraints.maxHeight * 0.7,
          child: currentLocation == null // 현재 위치가 없다면 loading. 있으면 지도 띄움
              ? const Center(
                  child: Text('loading'),
                )
              : GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(currentLocation!.latitude!,
                          currentLocation!.longitude!),
                      zoom: 17.5),
                ),
        );
      },
    );
  }
}
