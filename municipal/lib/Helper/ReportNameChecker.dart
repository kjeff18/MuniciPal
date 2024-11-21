import 'package:municipal/DesingContstant.dart';

class ReportNameChecker {

final Map<String, Map<String, dynamic>> _ReportCheker = {
  "ph": {"value": pothole, "name": "Pothole"},
  "st": {"value": streetlight, "name": "Street Light"},
  "wt": {"value": waterLeak, "name": "Water Leak"},
  "tl": {"value": trafficLight, "name": "Traffic Light"},
  "rw": {"value": roadway, "name": "Roadway"},
  "sw": {"value": sidewalk, "name": "Sidewalk"},
  "ss": {"value": streetSign, "name": "Street Sign"},
  "dr": {"value": drainage, "name": "Drainage"},
  "pm": {"value": parkMatainance, "name": "Park Maintenance"},
  "tm": {"value": treeMaintenance, "name": "Tree Maintenance"},
  "pc": {"value": pedestrianCrossing, "name": "Pedestrian Crossing"},
  "gr": {"value": graffiti, "name": "Graffiti"},
  "ot": {"value": more, "name": "Other"},
};


String getReportName(String code) {
  return _ReportCheker[code]?['name'] ?? 'Unknown';
}

dynamic getReportIconPath(String code) {
  return _ReportCheker[code]?['value'] ?? null;
}

  
}