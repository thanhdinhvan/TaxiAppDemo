import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _tripDistance = 0;

  // final Map<String, Marker> _marker = <String, Marker>{};

  GoogleMapController? _mapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
            color: Colors.white,
            child: Stack(children: [
              GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  _mapController = controller;
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(10.7915178, 106.7271422),
                  zoom: 14.4746,
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      leading: FlatButton(
                          onPressed: () {
                            print("click menu");
                          },
                          child: Image.asset("menu.png")),
                      actions: [Image.asset("bell.png")],
                    ),
                  ],
                ),
              ),
            ])));
  }
}
