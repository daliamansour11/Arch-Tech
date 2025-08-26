class RuinDetails {
  final int id;
  final String name;
  final String description;
  final String image;
  final String rate;
  final bool is_fav;
  final int totalComments;
  final int distance;
  final String type;
  final List<NearbyPlace> nearbyPlaces;

  RuinDetails({
    required this.distance,
    required this.id,
    required this.totalComments,
    required this.is_fav,
    required this.name,
    required this.description,
    required this.image,
    required this.type,
    required this.rate,
    required this.nearbyPlaces,
  });

  factory RuinDetails.fromJson(Map<String, dynamic> json) {
    return RuinDetails(
      totalComments: json['total_comments'],
      distance: json['distance_between_user_ruin'],
      id: json['id'],
      rate: json['rate'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      type: json['type'],
      nearbyPlaces: (json['nearby_places'] as List)
          .map((place) => NearbyPlace.fromJson(place))
          .toList(), is_fav: json['is_fav'] == 1,
    );
  }
}

class NearbyPlace {
  final int id;
  final String name;
  final String description;
  final String image;
  final String type;

  NearbyPlace({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.type,
  });

  factory NearbyPlace.fromJson(Map<String, dynamic> json) {
    return NearbyPlace(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      type: json['type'],
    );
  }
}