import 'dart:convert';

class Quickreport {
  final int userId;
  final double latitude; 
  final double longitude; 

  Quickreport ({
    required this.userId,
    required double this.latitude,
    required double this.longitude
  });

  factory Quickreport.fromJson (Map<String,dynamic> json)
  {
    return Quickreport(
      userId: json['userId'],
      latitude: json['latitude'],
      longitude: json['longitude'],
     );
  }

  Map <String, dynamic> toJson ()
  {
    return {
      'userId': userId,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

}