import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:municipal/DesingContstant.dart';

class PostNMapContainer extends StatelessWidget {
  const PostNMapContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return // Container holding the PageView with constrained height
          Container(
            height: MediaQuery.of(context).size.height * 0.4, // Constrain the height of the PageView
            decoration: BoxDecoration(
              border: Border.all(
                color: accentColor,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(textFieldBorderRadius)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: PageView(
                controller: PageController(viewportFraction: 1),
                scrollDirection: Axis.horizontal,
                children: [
                  // First page - Image
                  Image.asset("assets/IssueIcons/image.png"),
                  const GoogleMap(
                      zoomControlsEnabled: false,
                      rotateGesturesEnabled: false,
                      tiltGesturesEnabled: false,
                      myLocationButtonEnabled: false,
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(30.4076640376, -91.179755360),
                        zoom: 15,
                      ),
                    ),
                         
                ],
              ),
            ),
          );
  }
}