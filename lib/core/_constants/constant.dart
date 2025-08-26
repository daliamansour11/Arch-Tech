import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final class Constant {
  const Constant._();
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration connectTimeout = Duration(seconds: 10);
  static const Map<String, dynamic> headers = {
    'Content-Type': 'application/vnd.api+json',
    'Accept': 'application/vnd.api+json',
  };
  static const pageTransitionDuration = Duration(milliseconds: 300);
  static const Curve pageTransitionCurve = Curves.easeInOut;

  static const audioFormat = 'audio/wav';

  /// Duration constants for progress tracking
  static const int totalDuration = 45; // Total duration in seconds
  static const int stepDuration = 3; // Time step for each progress update
  static const loadingDuration = Duration(milliseconds: 700);
  static const durationZero = Duration(seconds: 0);
  static const progressTimerDuration = Duration(seconds: stepDuration);
  static const cameraPosition = CameraPosition(
    target: LatLng(30.0444, 31.2357),
    zoom: 14.4746,
  );
  
}
