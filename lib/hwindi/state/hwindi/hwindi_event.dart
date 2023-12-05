part of 'hwindi_bloc.dart';

abstract class HwindiEvent extends Equatable {
  const HwindiEvent();
}

class GetLocationsEvent extends HwindiEvent {
  const GetLocationsEvent(this.query);
  final String query;

  @override
  List<Object?> get props => [query];
}

class SetPickupLocationEvent extends HwindiEvent {
  const SetPickupLocationEvent(this.location);
  final HwindiLocation location;

  @override
  List<Object?> get props => [location];
}

class SetDropOffLocationEvent extends HwindiEvent {
  const SetDropOffLocationEvent(this.location);
  final HwindiLocation location;

  @override
  List<Object?> get props => [location];
}

class ResetBlocEvent extends HwindiEvent {
  const ResetBlocEvent();

  @override
  List<Object?> get props => [];
}

class GetRouteEvent extends HwindiEvent {
  const GetRouteEvent();

  @override
  List<Object?> get props => [];
}
