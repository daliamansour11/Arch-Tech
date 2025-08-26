import 'package:geolocator/geolocator.dart';

class RuinsModel {
  final bool? success;
  final List<Ruin> data;
  final String? message;

  const RuinsModel({
    this.success,
    this.data = const [],
    this.message,
  });

  factory RuinsModel.fromJson(Map<String, dynamic> json) {
    return RuinsModel(
      success: json['success'],
      data: List<Ruin>.from(json['data']?.map((x) => Ruin.fromJson(x)) ?? []),
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.map((v) => v.toJson()).toList(),
      'message': message,
    };
  }

  /// Calculate distance for each ruin based on user location
  void calculateDistances(double userLat, double userLng) {
    for (final ruin in data) {
      ruin.calculateDistance(userLat, userLng);
    }
  }
}

class Ruin {
  final int id;
  final String name;
  final String description;
  final String image;
  final String type;
  final int governorateId;
  final int regionId;
  final String workDate;
  final String createdAt;
  final String updatedAt;
  final double lat;
  final double lang;
  final String governorateName;
  final String regionName;
  final String? mapPhoto;
  final String rate;
  bool isFav;
  double? distance;

  Ruin({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.type,
    required this.governorateId,
    required this.regionId,
    required this.workDate,
    required this.createdAt,
    required this.updatedAt,
    required this.lat,
    required this.lang,
    required this.governorateName,
    required this.regionName,
    required this.isFav,
    required this.rate,
    this.mapPhoto,
    this.distance,
  });

  factory Ruin.fromJson(Map<String, dynamic> json) {
    return Ruin(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      type: json['type'],
      governorateId: json['governorate_id'],
      regionId: json['region_id'],
      workDate: json['work_date'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      lat: json['lat']?.toDouble() ?? 0.0,
      lang: json['lang']?.toDouble() ?? 0.0,
      governorateName: json['governorate_name'],
      regionName: json['region_name'],
      isFav: json['is_fav'] == 1,
      rate: json['rate'] ?? '0.0',
      mapPhoto: json['map_photo'],
      distance: (json['distance_between_user_ruin'] != null)
          ? (json['distance_between_user_ruin'] as num).toDouble()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'type': type,
      'governorate_id': governorateId,
      'region_id': regionId,
      'work_date': workDate,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'lat': lat,
      'lang': lang,
      'governorate_name': governorateName,
      'region_name': regionName,
      'is_fav': isFav,
      'rate': rate,
      'map_photo': mapPhoto,
      'distance_between_user_ruin': distance,
    };
  }

  /// Calculates distance from user and updates `distance` field
  void calculateDistance(double userLat, double userLng) {
    if (lat != 0.0 && lang != 0.0) {
      distance = Geolocator.distanceBetween(userLat, userLng, lat, lang) / 1000;
    }
  }

  Ruin copyWith({
    int? id,
    String? name,
    String? description,
    String? image,
    String? type,
    int? governorateId,
    int? regionId,
    String? workDate,
    String? createdAt,
    String? updatedAt,
    double? lat,
    double? lang,
    String? governorateName,
    String? regionName,
    String? rate,
    bool? isFav,
    String? mapPhoto,
    double? distance,
  }) {
    return Ruin(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      type: type ?? this.type,
      governorateId: governorateId ?? this.governorateId,
      regionId: regionId ?? this.regionId,
      workDate: workDate ?? this.workDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lat: lat ?? this.lat,
      lang: lang ?? this.lang,
      governorateName: governorateName ?? this.governorateName,
      regionName: regionName ?? this.regionName,
      rate: rate ?? this.rate,
      isFav: isFav ?? this.isFav,
      mapPhoto: mapPhoto ?? this.mapPhoto,
      distance: distance ?? this.distance,
    );
  }
}
