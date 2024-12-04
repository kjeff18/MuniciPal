import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'
    as google_maps_flutter;
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/Helper/IssueCategory.dart';
import 'package:municipal/models/ModelProvider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PostNMapContainer extends StatelessWidget {
  final Issue issue;

  const PostNMapContainer({super.key, required this.issue});

  Future<google_maps_flutter.Marker> getMarker() async {
    if (issue.category != null &&
        IssueCategory.values.contains(issue.category)) {
      final iconPath = ReportType.getBubbleIconPath(issue.category!);
      if (iconPath != null) {
        final icon = await google_maps_flutter.BitmapDescriptor.asset(
          const ImageConfiguration(size: Size(48, 48)),
          iconPath,
        );
        return google_maps_flutter.Marker(
          markerId: google_maps_flutter.MarkerId(issue.id),
          position: google_maps_flutter.LatLng(issue.latitude, issue.longitude),
          icon: icon,
        );
      }
    }
    return google_maps_flutter.Marker(
      markerId: google_maps_flutter.MarkerId(issue.id),
      position: google_maps_flutter.LatLng(issue.latitude, issue.longitude),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5, // Constrain the height
      decoration: BoxDecoration(
        border: Border.all(
          color: accentColor,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(textFieldBorderRadius),
        ),
      ),
      child: FutureBuilder<google_maps_flutter.Marker>(
        future: getMarker(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading spinner while the marker is being resolved
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Handle errors
            return const Center(
              child: Text("Failed to load marker."),
            );
          } else if (snapshot.hasData) {
            final marker = snapshot.data!;
            return PageView(
              controller: PageController(viewportFraction: 1),
              scrollDirection: Axis.horizontal,
              children: [
                // First page - Image carousel
                if (issue.imageUrls != null && issue.imageUrls!.isNotEmpty)
                  ...issue.imageUrls!.map((url) {
                    return CachedNetworkImage(
                      imageUrl: url,
                      fit: BoxFit.cover,
                      errorWidget: (context, error, stackTrace) => const Center(
                        child: Icon(
                          Icons.broken_image,
                          color: Colors.grey,
                          size: 50,
                        ),
                      ),
                    );
                  })
                else
                  const Center(
                    child: Text("No images available."),
                  ),
                // Last page - Google Map
                google_maps_flutter.GoogleMap(
                  initialCameraPosition: google_maps_flutter.CameraPosition(
                    target: google_maps_flutter.LatLng(
                      issue.latitude,
                      issue.longitude,
                    ),
                    zoom: 15,
                  ),
                  markers: {marker},
                  zoomControlsEnabled: false,
                  rotateGesturesEnabled: false,
                  tiltGesturesEnabled: false,
                  myLocationButtonEnabled: false,
                  mapType: google_maps_flutter.MapType.normal,
                ),
              ],
            );
          } else {
            // Handle unexpected cases
            return const Center(
              child: Text("No marker data available."),
            );
          }
        },
      ),
    );
  }
}
