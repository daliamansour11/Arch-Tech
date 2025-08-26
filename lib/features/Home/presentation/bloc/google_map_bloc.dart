import 'dart:async';

import 'package:archtech/core/_constants/images_constants.dart';
import 'package:archtech/core/api/session_data.dart';
import 'package:archtech/features/Home/data/models/ruins_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'google_map_bloc.freezed.dart';
part 'google_map_event.dart';
part 'google_map_state.dart';

class GoogleMapBloc extends Bloc<GoogleMapEvent, GoogleMapState> {
  final Completer<GoogleMapController> _controller = Completer();

  final ruins = SessionData.ruins;
  Set<Marker> get marker => markers;
  GoogleMapBloc() : super(const GoogleMapState.initial()) {
    on<GoogleMapEvent>((event, emit) async {
      await event.whenOrNull(
        loadMarkersInBackground: () async {
          try {
            for (final ruin in ruins) {
              // Skip the one already added
              if (markers.any((m) => m.markerId.value == ruin.id.toString())) {
                continue;
              }

              final icon = await _handelMarkerImage(ruin.mapPhoto);
              final marker = Marker(
                markerId: MarkerId(ruin.id.toString()),
                position: LatLng(ruin.lat, ruin.lang),
                draggable: false,
                infoWindow: InfoWindow(
                  onTap: () {
                    add(GoogleMapEvent.onMarkerTap(ruin));
                  },
                  title: ruin.name,
                  snippet: ruin.description,
                ),
                onTap: () {
                  add(GoogleMapEvent.onMarkerTap(ruin));
                },
                icon: icon,
              );

              markers.add(marker);
              // Delay slightly to avoid UI jank
              await Future.delayed(const Duration(milliseconds: 100));
            }
          } catch (e) {
            emit(GoogleMapState.error(message: e.toString()));
          }
        },
        goToRuin: (ruin) async {
          emit(const GoogleMapState.loading());
          try {
            await _handleMarkers();
            final nearestRuinLatLng = LatLng(ruin.lat, ruin.lang);
            final mapController = await _controller.future;
            await mapController.animateCamera(
              CameraUpdate.newLatLng(nearestRuinLatLng),
            );
            emit(const GoogleMapState.loaded());
            emit(GoogleMapState.pickLocation(ruin));
          } catch (e) {
            emit(GoogleMapState.error(message: e.toString()));
          }
        },
        onMarkerTap: (ruin) async {
          emit(GoogleMapState.pickLocation(ruin)); // Handle marker tap
        },
        getMarker: () async {
          emit(const GoogleMapState.loading());
          try {
            if (ruins.isEmpty) {
              add(const GoogleMapEvent.getCurrentLocation());
            } else {
              // If the list is not empty, move the camera to the nearest ruin
              final nearestRuin = await _findNearestRuin(ruins);
              if (nearestRuin != null) {
                final nearestRuinLatLng =
                    LatLng(nearestRuin.lat, nearestRuin.lang);
                if (_controller.isCompleted) {
                  final mapController = await _controller.future;
                  await mapController.animateCamera(
                    CameraUpdate.newLatLng(nearestRuinLatLng),
                  );
                }
              }

              await _handleMarkers();
            }

            emit(const GoogleMapState.loaded());
          } catch (e) {
            emit(GoogleMapState.error(message: e.toString()));
          }
        },
        getCurrentLocation: () async {
          emit(const GoogleMapState.loading());
          try {
            LocationPermission permission = await Geolocator.checkPermission();
            if (permission == LocationPermission.denied) {
              permission = await Geolocator.requestPermission();
            }
            if (permission == LocationPermission.deniedForever) {
              emit(const GoogleMapState.error(
                message: 'Location permissions are permanently denied.',
              ));
              return;
            }

            final position = await Geolocator.getCurrentPosition();
            final currentLocation =
                LatLng(position.latitude, position.longitude);

            if (_controller.isCompleted) {
              final mapController = await _controller.future;
              await mapController.animateCamera(
                CameraUpdate.newLatLng(currentLocation),
              );
            }
            final icon = await BitmapDescriptor.asset(
              const ImageConfiguration(),
              ImagesConstantsAsset.marker,
            );

            final marker = Marker(
              markerId: const MarkerId('currentLocation'),
              position: currentLocation,
              draggable: true,
              onDrag: (value) {},
              icon: icon,
            );
            markers.add(marker);

            emit(const GoogleMapState.loaded());
          } catch (e) {
            emit(GoogleMapState.error(message: e.toString()));
          }
        },
      );
    });
  }

  Future<Ruin?> _findNearestRuin(List<Ruin> ruins) async {
    if (ruins.isEmpty) return null;

    final position = await Geolocator.getCurrentPosition();
    final currentLocation = LatLng(position.latitude, position.longitude);

    Ruin? nearestRuin;
    double? nearestDistance;

    for (final ruin in ruins) {
      final ruinLocation = LatLng(ruin.lat, ruin.lang);
      final distance = _calculateDistance(currentLocation, ruinLocation);

      if (nearestDistance == null || distance < nearestDistance) {
        nearestDistance = distance;
        nearestRuin = ruin;
      }
    }

    return nearestRuin;
  }

  double _calculateDistance(LatLng start, LatLng end) {
    return Geolocator.distanceBetween(
      start.latitude,
      start.longitude,
      end.latitude,
      end.longitude,
    );
  }

  Completer<GoogleMapController> get controller => _controller;

  @override
  Future<void> close() async {
    if (_controller.isCompleted) {
      final mapController = await _controller.future;
      mapController.dispose();
    }
    return super.close();
  }

  Future _handelMarkerImage(String? image) async {
    if (image != null) {
      // Fetch the image from the URL
      final imageData = await _fetchImage(image);

      // Convert the fetched image to BitmapDescriptor
      final icon = await _getMarkerIcon(imageData);

      return icon;
    } else {
      final icon = await BitmapDescriptor.asset(
        const ImageConfiguration(),
        'assets/images/athar.png',
      );

      return icon;
    }
  }

  Future _handleMarkers() async {
    if (markers.isEmpty && ruins.isNotEmpty) {
      final nearestRuin = await _findNearestRuin(ruins);
      if (nearestRuin != null) {
        final icon = await _handelMarkerImage(nearestRuin.mapPhoto);
        final marker = Marker(
          markerId: MarkerId(nearestRuin.id.toString()),
          position: LatLng(nearestRuin.lat, nearestRuin.lang),
          draggable: false,
          infoWindow: InfoWindow(
            onTap: () {
              add(GoogleMapEvent.onMarkerTap(nearestRuin));
            },
            title: nearestRuin.name,
            snippet: nearestRuin.description,
          ),
          onTap: () {
            add(GoogleMapEvent.onMarkerTap(nearestRuin));
          },
          icon: icon,
        );
        markers.add(marker);
      }

      // Emit the initial loaded state after adding nearest ruin
      await Future.delayed(const Duration(milliseconds: 300));
      add(const GoogleMapEvent.loadMarkersInBackground());
    }
  }
}

// Add this function to convert the fetched image (Uint8List) to BitmapDescriptor
Future<BitmapDescriptor> _getMarkerIcon(Uint8List imageData) async {
  // Resize the image to the desired dimensions (optional)
  final codec = await ui.instantiateImageCodec(imageData, targetWidth: 100);
  final frame = await codec.getNextFrame();
  final byteData = await frame.image.toByteData(format: ui.ImageByteFormat.png);

  if (byteData != null) {
    return BitmapDescriptor.bytes(byteData.buffer.asUint8List());
  } else {
    throw Exception('Failed to convert image to byte data.');
  }
}

// Function to fetch an image from a URL and convert it to Uint8List
Future<Uint8List> _fetchImage(String imageUrl) async {
  final response = await http.get(Uri.parse(imageUrl));
  if (response.statusCode == 200) {
    return response.bodyBytes;
  } else {
    throw Exception('Failed to load image from URL: $imageUrl');
  }
}

final Set<Marker> markers = <Marker>{};
