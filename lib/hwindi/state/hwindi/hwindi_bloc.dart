import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:injectable/injectable.dart';

import '../../../core/models/data/application_error.dart';
import '../../models/data/hwindi_location.dart';
import '../../models/repos/abs/locations_repository.dart';

part 'hwindi_event.dart';
part 'hwindi_state.dart';

@injectable
class HwindiBloc extends Bloc<HwindiEvent, HwindiState> {
  HwindiBloc({required this.repository}) : super(const HwindiState([])) {
    on<GetLocationsEvent>(onGetLocations);
    on<SetPickupLocationEvent>(onSetPickupLocation);
    on<SetDropOffLocationEvent>(onSetDropOffLocation);
    on<ResetBlocEvent>(onResetBloc);
    on<GetRouteEvent>(onGetRoute);
  }

  Future<void> onGetLocations(
    GetLocationsEvent event,
    Emitter<HwindiState> emit,
  ) async {
    try {
      final Either<ApplicationError, List<HwindiLocation>> response =
          await repository.getLocations(event.query);
      response.fold(
        (l) => null,
        (r) => emit(state.copyWith(locations: r)),
      );
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
    }
  }

  Future<void> onSetPickupLocation(
    SetPickupLocationEvent event,
    Emitter<HwindiState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          pickupLocation: event.location,
          locations: [],
        ),
      );
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
    }
  }

  Future<void> onSetDropOffLocation(
    SetDropOffLocationEvent event,
    Emitter<HwindiState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          dropOffLocation: event.location,
          locations: [],
        ),
      );
      add(const GetRouteEvent());
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
    }
  }

  Future<void> onResetBloc(
    ResetBlocEvent event,
    Emitter<HwindiState> emit,
  ) async {
    try {
      emit(
        const HwindiState([]),
      );
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
    }
  }

  Future<void> onGetRoute(
    GetRouteEvent event,
    Emitter<HwindiState> emit,
  ) async {
    try {
      final Either<ApplicationError, List<PointLatLng>> response =
          await repository.getRoute(
        state.pickupLocation!,
        state.dropOffLocation!,
      );
      response.fold(
        (l) => null,
        (r) => emit(state.copyWith(route: r)),
      );
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
    }
  }

  final LocationsRepository repository;
}
