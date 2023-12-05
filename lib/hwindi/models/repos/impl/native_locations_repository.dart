//
//  x_hwindi
//  native_locations_repository
//
//  Created by Ngonidzashe Mangudya on 05/12/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_geocoding/google_geocoding.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/models/data/application_error.dart';
import '../../data/hwindi_location.dart';
import '../abs/locations_repository.dart';

@LazySingleton(as: LocationsRepository)
class NativeLocationsRepository implements LocationsRepository {
  @override
  Future<Either<ApplicationError, List<HwindiLocation>>> getLocations(
    String query,
  ) async {
    try {
      final GoogleGeocoding googleGeocoding =
          GoogleGeocoding('AIzaSyDBaLlhpFc6o7G9Y-4CE6eoNpyHFK_reGU');
      final GeocodingResponse? response = await googleGeocoding.geocoding.get(
        query,
        [],
      );

      final List<HwindiLocation> hwindiLocations = [];

      if (response != null) {
        response.results?.forEach((GeocodingResult result) {
          log(result.formattedAddress ?? '');
          hwindiLocations.add(
            HwindiLocation(
              name: result.formattedAddress ?? '',
              latitude: result.geometry?.location?.lat ?? 0.0,
              longitude: result.geometry?.location?.lng ?? 0.0,
            ),
          );
        });
      }

      return Right(hwindiLocations);
    } catch (e, s) {
      log(
        e.toString(),
        error: e,
        stackTrace: s,
      );
      return Left(ApplicationError(e.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, List<HwindiLocation>>> resolvePlaceName(
      double latitude, double longitude) {
    // TODO: implement resolvePlaceName
    throw UnimplementedError();
  }

  @override
  Future<Either<ApplicationError, List<PointLatLng>>> getRoute(
    HwindiLocation pickup,
    HwindiLocation destination,
  ) async {
    try {
      final PolylinePoints polylinePoints = PolylinePoints();
      final PolylineResult result =
          await polylinePoints.getRouteBetweenCoordinates(
        'AIzaSyDBaLlhpFc6o7G9Y-4CE6eoNpyHFK_reGU',
        PointLatLng(pickup.latitude!, pickup.longitude!),
        PointLatLng(destination.latitude!, destination.longitude!),
      );

      return Right(result.points);
    } catch (e, s) {
      log(
        e.toString(),
        error: e,
        stackTrace: s,
      );
      return Left(ApplicationError(e.toString()));
    }
  }
}
