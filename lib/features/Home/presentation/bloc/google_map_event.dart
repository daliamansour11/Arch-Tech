part of 'google_map_bloc.dart';

@freezed
class GoogleMapEvent with _$GoogleMapEvent {
  const factory GoogleMapEvent.getMarker() = _GetMarker;
  const factory GoogleMapEvent.getCurrentLocation() = _GetCurrentLocation;
  const factory GoogleMapEvent.goToRuin(Ruin ruin) = _GoToRuin;
  const factory GoogleMapEvent.onMarkerTap(Ruin ruin) = _OnMarkerTap;
  const factory GoogleMapEvent.loadMarkersInBackground() =
      _LoadMarkersInBackground;
}

// Add this class to handle the new event if it doesn't exist in your generated code
