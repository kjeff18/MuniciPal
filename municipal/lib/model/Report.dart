class Report {
  final int userId; 
  final double latitude;
  final double longitude;
  final String description;
  final String photoUrl; 
  Report({
    required this.userId,
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.photoUrl,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      userId: json['userId'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      description: json['description'],
      photoUrl: json['photoUrl'], 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'latitude': latitude,
      'longitude': longitude,
      'description': description,
      'photoUrl': photoUrl, 
    };
  }
}
