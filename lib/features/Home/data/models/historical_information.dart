class HistoricalInformation {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  HistoricalInformation({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  factory HistoricalInformation.fromJson(Map<String, dynamic> json) {
    return HistoricalInformation(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['image'],
    );
  }
}
