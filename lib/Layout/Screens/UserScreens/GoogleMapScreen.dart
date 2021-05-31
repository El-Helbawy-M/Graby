import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:graby/Data/Models/User.dart';
import 'package:graby/Layout/Widgets/App%20AppBar.dart';
import 'package:graby/Layout/Widgets/App%20NavigationBar.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Marker marker = new Marker(markerId: MarkerId('value'));
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: appBar,
      //==========================================
      //==========================================
      body: FutureBuilder<Position>(
        future: Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium),
        builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
          if (snapshot.data != null) {
            Position position = snapshot.data;
            return GoogleMap(
              mapType: MapType.normal,
              markers: {marker},
              onMapCreated: (controller) => setState(
                () => marker = Marker(
                  infoWindow: InfoWindow(
                    title: "Title",
                    snippet: "this is a content",
                  ),
                  markerId: MarkerId('s'),
                  position: LatLng(
                    position.latitude,
                    position.longitude,
                  ),
                ),
              ),
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  position.latitude,
                  position.longitude,
                ),
                zoom: 15,
              ),
            );
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
      //==========================================
      //==========================================
      bottomNavigationBar: UserHomeNavigationBar(index: 1, arguments: user, parentContext: context),
    );
  }
}
