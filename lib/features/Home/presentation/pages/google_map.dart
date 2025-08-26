import 'package:archtech/core/_constants/constant.dart';
import 'package:archtech/core/extension/dialog_on_context.dart';
import 'package:archtech/core/extension/size_on_context.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/features/Home/presentation/bloc/google_map_bloc.dart';
import 'package:archtech/features/Home/presentation/widgets/get_current_location_button.dart';
import 'package:archtech/features/Home/presentation/widgets/location_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyGoogleMap extends StatefulWidget {
  const MyGoogleMap({super.key});

  @override
  State<MyGoogleMap> createState() => _MyGoogleMapState();
}

class _MyGoogleMapState extends State<MyGoogleMap> {
  // Flag to prevent multiple initializations
  bool _isMapInitialized = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<GoogleMapBloc, GoogleMapState>(
          builder: (context, state) {
            return GoogleMap(
              padding: const EdgeInsets.all(8),
              markers: context.read<GoogleMapBloc>().marker,
              zoomControlsEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                // Only complete the controller once
                if (!_isMapInitialized &&
                    !context.read<GoogleMapBloc>().controller.isCompleted) {
                  context.read<GoogleMapBloc>().controller.complete(controller);

                  // Trigger getMarker event after map is created
                  if (!_isMapInitialized) {
                    Future.delayed(const Duration(milliseconds: 100), () {
                      if (mounted) {
                        context
                            .read<GoogleMapBloc>()
                            .add(const GoogleMapEvent.getMarker());
                        _isMapInitialized = true;
                      }
                    });
                  }
                }
              },
              initialCameraPosition: Constant.cameraPosition,
            );
          },
        ),
        const GetCurrentLocationButton(),
        const LocationCard(),
        const DirectionsButton(),
        BlocBuilder<GoogleMapBloc, GoogleMapState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
        MultiBlocListener(
          listeners: [
            BlocListener<GoogleMapBloc, GoogleMapState>(
              listener: (context, state) {
                state.whenOrNull(
                  error: (message) {
                    context.errorDialog(message);
                  },
                );
              },
            ),
          ],
          child: const SizedBox.shrink(),
        )
      ],
    );
  }
}

class DirectionsButton extends StatelessWidget {
  const DirectionsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleMapBloc, GoogleMapState>(
      builder: (context, state) {
        return state.maybeWhen(
          pickLocation: (ruins) => PositionedDirectional(
            bottom: context.height * 0.21,
            start: 0,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                shape: const CircleBorder(),
                onPressed: () async {
                  final url =
                      'https://www.google.com/maps/dir/?api=1&destination=${ruins.lat},${ruins.lang}&travelmode=driving';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url),
                        mode: LaunchMode.externalApplication);
                  } else {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Could not open Google Maps')),
                      );
                    }
                  }
                },
                child: const Icon(Icons.directions, color: ColorManger.primary),
              ),
            ),
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
