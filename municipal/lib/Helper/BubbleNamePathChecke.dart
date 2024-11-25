import 'package:municipal/DesingContstant.dart';

class BubbleNamePathChecker {

    final Map<String, String> markerIconPaths = {
    "pothole": potholeBubble,
    "traffic_light":trafficLightBubble,
    "street_light": streetLightBubble,
    "drainage": drainageBubble,
    "graffiti": graffitiBubble,
    "other": otherBubble,
    "crosswalk": pedestrianCrossingBubble,
    "Park Maintenance": parkMatainanceBubble,
    "waterLeak": waterLeakBubble,
    "roadway": roadWayBubble,
    "sideWalk": sidewalkBubble,
    "street Sign": streetSignBubble,
    "tree Matainance": treeMaintenanceBubble,
  };

  String? getMapIconPath (String issueType)
  {
    return markerIconPaths[issueType] ?? null ;
  }
  
}