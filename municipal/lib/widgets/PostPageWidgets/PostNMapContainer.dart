import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps_flutter;
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/Helper/ReportType.dart';
import 'package:municipal/models/ModelProvider.dart';

class PostNMapContainer extends StatefulWidget {
  final Issue issue;

  const PostNMapContainer({super.key, required this.issue});

  @override
  _PostNMapContainerState createState() => _PostNMapContainerState();
}

class _PostNMapContainerState extends State<PostNMapContainer> {
  google_maps_flutter.Marker? _cachedMarker;

  @override
  void initState() {
    super.initState();
    _loadMarker();
  }

  Future<void> _loadMarker() async {
    // Only load the marker once to avoid fetching it every time the widget rebuilds
    if (_cachedMarker == null) {
      final marker = await getMarker();
      setState(() {
        _cachedMarker = marker;
      });
    }
  }

  Future<google_maps_flutter.Marker> getMarker() async {
    if (widget.issue.category != null &&
        IssueCategory.values.contains(widget.issue.category)) {
      final iconPath = ReportType.getBubbleIconPath(widget.issue.category!);
      if (iconPath != null) {
        final icon = await google_maps_flutter.BitmapDescriptor.asset(
          const ImageConfiguration(size: Size(50, 50)),
          iconPath,
        );
        return google_maps_flutter.Marker(
          markerId: google_maps_flutter.MarkerId(widget.issue.id),
          position: google_maps_flutter.LatLng(widget.issue.latitude, widget.issue.longitude),
          icon: icon,
        );
      }
    }
    // If no icon path is found, just return a default marker without an icon
    return google_maps_flutter.Marker(
      markerId: google_maps_flutter.MarkerId(widget.issue.id),
      position: google_maps_flutter.LatLng(widget.issue.latitude, widget.issue.longitude),
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
      child: _cachedMarker == null
          ? const Center(child: CircularProgressIndicator()) // Show a loading spinner until the marker is available
          : PageView(
              controller: PageController(viewportFraction: 1),
              scrollDirection: Axis.horizontal,
              children: [
                // First page - Image carousel
                if (widget.issue.imageUrls != null && widget.issue.imageUrls!.isNotEmpty)
                  ...widget.issue.imageUrls!.map((url) {
                    return Image.network(
                      url,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Center(
                        child: Icon(
                          Icons.broken_image,
                          color: Colors.grey,
                          size: 50,
                        ),
                      ),
                    );
                  }).toList()
                else
                  const Center(
                    child: Text("No images available."),
                  ),
                // Last page - Google Map
                google_maps_flutter.GoogleMap(
                  initialCameraPosition: google_maps_flutter.CameraPosition(
                    target: google_maps_flutter.LatLng(
                      widget.issue.latitude,
                      widget.issue.longitude,
                    ),
                    zoom: 15,
                  ),
                  markers: {_cachedMarker!},
                  zoomControlsEnabled: false,
                  rotateGesturesEnabled: false,
                  tiltGesturesEnabled: false,
                  myLocationButtonEnabled: false,
                  mapType: google_maps_flutter.MapType.normal,
                ),
              ],
            ),
    );
  }
}
