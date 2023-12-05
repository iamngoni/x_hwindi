//
//  x_hwindi
//  hwindi_map
//
//  Created by Ngonidzashe Mangudya on 05/12/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/modals/modal.dart';
import '../../../core/utils/extensions.dart';
import '../../../core/views/widgets/hwindi_text_field.dart';
import '../../state/hwindi/hwindi_bloc.dart';
import '../widgets/hwindi_floating_back_button.dart';

class HwindiMapPage extends StatefulWidget {
  const HwindiMapPage({super.key});

  @override
  State<HwindiMapPage> createState() => _HwindiMapPageState();
}

class _HwindiMapPageState extends State<HwindiMapPage> {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  static const CameraPosition googlePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Future<void> goToPosition(LatLng location) async {
    final GoogleMapController controller = await mapController.future;
    final CameraPosition position = CameraPosition(
      target: location,
      tilt: 59.440717697143555,
      zoom: 19.151926040649414,
    );
    await controller.animateCamera(CameraUpdate.newCameraPosition(position));
  }

  final TextEditingController pickupLocationController =
      TextEditingController();
  final TextEditingController dropOffLocationController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(
      200.milliseconds,
      () => $showModal(
        context,
        child: searchBox(),
      ),
    );
    pickupLocationController.addListener(() {
      // if more than 2 characters, show suggestions
      if (pickupLocationController.text.length > 2) {
        context
            .read<HwindiBloc>()
            .add(GetLocationsEvent(pickupLocationController.text));
      }
    });

    dropOffLocationController.addListener(() {
      // if more than 2 characters, show suggestions
      if (dropOffLocationController.text.length > 2) {
        context
            .read<HwindiBloc>()
            .add(GetLocationsEvent(dropOffLocationController.text));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: context.height,
                width: context.width,
                child: BlocConsumer<HwindiBloc, HwindiState>(
                  listener: (context, state) {
                    if (state.pickupLocation != null &&
                        state.dropOffLocation != null) {
                      goToPosition(
                        LatLng(
                          state.pickupLocation!.latitude!,
                          state.pickupLocation!.longitude!,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return GoogleMap(
                      initialCameraPosition: googlePlex,
                      onMapCreated: mapController.complete,
                      onTap: goToPosition,
                      polylines: Set<Polyline>.of(
                        {
                          if (state.route != null)
                            'route': Polyline(
                              polylineId: const PolylineId('route'),
                              color: HwindiColors.yellow,
                              width: sx(12).toInt(),
                              startCap: Cap.roundCap,
                              endCap: Cap.roundCap,
                              points: state.route!
                                  .map((e) => LatLng(e.latitude, e.longitude))
                                  .toList(),
                            ),
                        }.values,
                      ),
                      markers: Set<Marker>.of(
                        {
                          if (state.pickupLocation != null)
                            Marker(
                              markerId: const MarkerId('pickup'),
                              position: LatLng(
                                state.pickupLocation!.latitude!,
                                state.pickupLocation!.longitude!,
                              ),
                              icon: BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueGreen,
                              ),
                            ),
                          if (state.dropOffLocation != null)
                            Marker(
                              markerId: const MarkerId('dropoff'),
                              position: LatLng(
                                state.dropOffLocation!.latitude!,
                                state.dropOffLocation!.longitude!,
                              ),
                              icon: BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueRed,
                              ),
                            ),
                        },
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                left: sx(20),
                top: sy(40),
                child: const HwindiFloatingBackButton(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget searchBox() {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return BlocConsumer<HwindiBloc, HwindiState>(
          listener: (context, state) {
            if (state.dropOffLocation != null) {
              context.goBack();
            }
          },
          builder: (context, state) {
            return Container(
              height: context.height,
              width: context.width,
              padding: EdgeInsets.symmetric(
                horizontal: sx(20),
                vertical: sy(20),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const HwindiFloatingBackButton(),
                      SizedBox(
                        width: sx(20),
                      ),
                      Text(
                        'Where are you going?',
                        style: TextStyle(
                          color: HwindiColors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: sy(9),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sy(15),
                  ),
                  if (state.pickupLocation == null)
                    HwindiTextField(
                      controller: pickupLocationController,
                      hint: 'Pickup Location',
                    )
                  else
                    HwindiTextField(
                      controller: dropOffLocationController,
                      hint: 'Drop Off Location',
                    ),
                  SizedBox(
                    height: sy(10),
                  ),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: 300.milliseconds,
                      child: state.locations.isNotEmpty
                          ? Container(
                              decoration: BoxDecoration(
                                color: HwindiColors.white,
                                border: Border.all(
                                  color: HwindiColors.border,
                                  width: sy(1),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListView(
                                children: state.locations
                                    .map(
                                      (e) => ListTile(
                                        title: Text(e.name.toString()),
                                        onTap: () {
                                          if (state.pickupLocation == null) {
                                            context.read<HwindiBloc>().add(
                                                  SetPickupLocationEvent(e),
                                                );
                                          } else {
                                            context.read<HwindiBloc>().add(
                                                  SetDropOffLocationEvent(e),
                                                );
                                          }
                                        },
                                      ),
                                    )
                                    .toList(),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
