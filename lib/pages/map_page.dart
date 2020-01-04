import 'dart:async';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:govis/helper.dart';
import 'package:govis/model/campusfacility.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();

    fetchCampusFacilities();
  }

  fetchCampusFacilities() async {
    var res = await dio.getUri(getNodeUri("/campus"));
    var bitmapImage = await _getAssetIcon(context, "assets/images/marker.png");

    setState(() {
      res.data.forEach((c) {
        var campus = CampusFacility.fromJson(c);
        _markers.add(
          Marker(
            markerId: MarkerId(
              LatLng(campus.latitude, campus.longitude).toString(),
            ),
            position: LatLng(campus.latitude, campus.longitude),
            infoWindow: InfoWindow(
              title: campus.name,
            ),
            icon: bitmapImage,
          ),
        );
      });
    });
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.5920395624461, 127.035676113136),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _markers,
        onTap: onTap,
      ),
    );
  }

  void onTap(LatLng latlng) async {
    var bitmapImage = await _getAssetIcon(context, "assets/images/marker.png");

    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(
            latlng.toString(),
          ),
          position: latlng,
          infoWindow: InfoWindow(
            title: '선호지역',
          ),
          icon: bitmapImage,
        ),
      );
    });
  }

  Future<BitmapDescriptor> _getAssetIcon(
      BuildContext context, String assetPath) async {
    final Completer<BitmapDescriptor> bitmapIcon =
        Completer<BitmapDescriptor>();
    final ImageConfiguration config = createLocalImageConfiguration(context);

    AssetImage(assetPath)
        .resolve(config)
        .addListener(ImageStreamListener((ImageInfo image, bool sync) async {
      final ByteData bytes =
          await image.image.toByteData(format: ImageByteFormat.png);
      final BitmapDescriptor bitmap =
          BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
      bitmapIcon.complete(bitmap);
    }));

    return await bitmapIcon.future;
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
