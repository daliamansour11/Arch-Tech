class FavoriteRuin {
  final int id;
  final String name;
  final String description;
  final String image;
  final String type;
  final String governorateName;
  final String regionName;
  final bool isFav;


  FavoriteRuin({
    required this.id,
    required this.isFav,
    required this.name,
    required this.description,
    required this.image,
    required this.type,
    required this.governorateName,
    required this.regionName,
  });

  factory FavoriteRuin.fromJson(Map<String, dynamic> json) {
    return FavoriteRuin(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      type: json['type'],
      governorateName: json['governorate_name'],
      regionName: json['region_name'],
      isFav: json['is_fav'] == 1,
    );
  }
}