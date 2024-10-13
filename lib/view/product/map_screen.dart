import 'package:digital_kabaria_app/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

class MapScreen extends StatefulWidget {
  final double lat;
  final double lng;

  const MapScreen({Key? key, required this.lat, required this.lng}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LatLng initialLatLng;

  @override
  void initState() {
    super.initState();
    initialLatLng = LatLng(widget.lat, widget.lng); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          PlacePicker(
            
            apiKey: 'AIzaSyDka8c0sYp6KgWOnnwJwHsAzBxUZJTJZYY', 
            initialPosition: initialLatLng,
            useCurrentLocation: false, 
            onPlacePicked: (result) {
              setState(() {
               
              });
            },
            pinBuilder: (context, state) {
              return Icon(Icons.location_on, size: 50.0, color: Colors.red);
            },
          ),
        
        ],
      ),
    );
  }
}
