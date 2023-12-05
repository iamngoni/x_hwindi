//
//  x_hwindi
//  hwindi_location
//
//  Created by Ngonidzashe Mangudya on 05/12/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:freezed_annotation/freezed_annotation.dart';

part 'hwindi_location.freezed.dart';
part 'hwindi_location.g.dart';

@freezed
class HwindiLocation with _$HwindiLocation {
  const factory HwindiLocation({
    String? name,
    String? street,
    String? isoCountryCode,
    String? country,
    String? postalCode,
    String? administrativeArea,
    String? subAdministrativeArea,
    String? locality,
    double? latitude,
    double? longitude,
  }) = _HwindiLocation;

  const HwindiLocation._();

  factory HwindiLocation.fromJson(Map<String, dynamic> json) =>
      _$HwindiLocationFromJson(json);
}
