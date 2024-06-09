import 'dart:async';
import 'package:digital_kabaria_app/controllers/add_product_controller.dart';
import 'package:digital_kabaria_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  // late LatLng _center;
  // PickResult? selectedPlace;
  // String? address;
  // String appBarTitle = 'Pick a Location';

  @override
  void initState() {
    super.initState();
    controller.getCurrentLocation();
    // _getCurrentLocation(); 
  }
  AddProductController controller = Get.put(AddProductController());

  // Future<void> _getCurrentLocation() async {
  //   try {
  //     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //     setState(() {
  //       _center = LatLng(position.latitude, position.longitude); 
  //       _getAddressFromLatLng(_center);
  //     });
  //   } catch (e) {
  //     print('Failed to get current location: $e');
  //   }
  // }

  // Future<void> _getAddressFromLatLng(LatLng latLng) async {
  //   try {
  //     List<Placemark> placemarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
  //     if (placemarks.isNotEmpty) {
  //       Placemark placemark = placemarks[0];
  //       setState(() {
  //         address = '${placemark.street}, ${placemark.locality}, ${placemark.postalCode}, ${placemark.country}';
  //         print("address ${address}");
  //         appBarTitle = address ?? 'Pick a Location';
  //       });
  //     }
  //   } catch (e) {
  //     print('Failed to get address: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      body: Stack(
        children: [
          PlacePicker(
            apiKey: 'AIzaSyDka8c0sYp6KgWOnnwJwHsAzBxUZJTJZYY',
            initialPosition: controller.center,
            useCurrentLocation: true,
            onPlacePicked: (result) {
              // setState(() {
                controller.selectedPlace = result;
                controller.getAddressFromLatLng(LatLng(result.geometry!.location.lat, result.geometry!.location.lng));
                // _getAddressFromLatLng(LatLng(result.geometry!.location.lat, result.geometry!.location.lng));
              // });
            },
          ),
          if (controller.address != null)
            Positioned(
              top: 300.h,
              left: 20,
              right: 20,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    controller.address!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
