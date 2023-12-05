part of 'hwindi_bloc.dart';

class HwindiState extends Equatable {
  const HwindiState(
    this.locations, {
    this.pickupLocation,
    this.dropOffLocation,
    this.route,
  });

  final List<HwindiLocation> locations;
  final HwindiLocation? pickupLocation;
  final HwindiLocation? dropOffLocation;
  final List<PointLatLng>? route;

  HwindiState copyWith({
    List<HwindiLocation>? locations,
    HwindiLocation? pickupLocation,
    HwindiLocation? dropOffLocation,
    List<PointLatLng>? route,
  }) {
    return HwindiState(
      locations ?? this.locations,
      pickupLocation: pickupLocation ?? this.pickupLocation,
      dropOffLocation: dropOffLocation ?? this.dropOffLocation,
      route: route ?? this.route,
    );
  }

  @override
  List<Object?> get props =>
      [locations, pickupLocation, dropOffLocation, route];
}
