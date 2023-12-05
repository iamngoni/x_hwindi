// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hwindi_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HwindiLocationImpl _$$HwindiLocationImplFromJson(Map<String, dynamic> json) =>
    _$HwindiLocationImpl(
      name: json['name'] as String?,
      street: json['street'] as String?,
      isoCountryCode: json['isoCountryCode'] as String?,
      country: json['country'] as String?,
      postalCode: json['postalCode'] as String?,
      administrativeArea: json['administrativeArea'] as String?,
      subAdministrativeArea: json['subAdministrativeArea'] as String?,
      locality: json['locality'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$HwindiLocationImplToJson(
    _$HwindiLocationImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('street', instance.street);
  writeNotNull('isoCountryCode', instance.isoCountryCode);
  writeNotNull('country', instance.country);
  writeNotNull('postalCode', instance.postalCode);
  writeNotNull('administrativeArea', instance.administrativeArea);
  writeNotNull('subAdministrativeArea', instance.subAdministrativeArea);
  writeNotNull('locality', instance.locality);
  writeNotNull('latitude', instance.latitude);
  writeNotNull('longitude', instance.longitude);
  return val;
}
