//
//  x_hwindi
//  locations_repository
//
//  Created by Ngonidzashe Mangudya on 05/12/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:dartz/dartz.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import '../../../../core/models/data/application_error.dart';
import '../../data/hwindi_location.dart';

abstract class LocationsRepository {
  Future<Either<ApplicationError, List<HwindiLocation>>> getLocations(
    String query,
  );
  Future<Either<ApplicationError, List<HwindiLocation>>> resolvePlaceName(
    double latitude,
    double longitude,
  );
  Future<Either<ApplicationError, List<PointLatLng>>> getRoute(
    HwindiLocation pickup,
    HwindiLocation destination,
  );
}
