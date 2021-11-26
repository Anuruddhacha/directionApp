import 'package:dio/dio.dart';
import 'package:direct_me/directions_model.dart';
import 'package:flutter/foundation.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionsRepository {

  
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

   //late Dio _dio;

  //DirectionsRepository({required Dio dio}) : _dio = dio;

  Future<Directions?> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final response = await Dio().get(
      _baseUrl,
      queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': 'AIzaSyCi859EvKA5jdezzWN322R4yaM9WXBN4VQ',
      },
    );

    // Check if response is successful
    if (response.statusCode == 200) {
      return Directions.fromMap(response.data);
    }
    return null;
  }

  
}
