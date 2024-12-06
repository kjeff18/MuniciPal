import 'package:municipal/DesingContstant.dart';
import 'package:municipal/models/ModelProvider.dart';

class ReportType {

  static String getReportName(IssueCategory? issueCategory) {
    switch (issueCategory) {
      case IssueCategory.Pothole:
        return "Pothole";
      case IssueCategory.StreetLight:
        return "Street Light";
      case IssueCategory.WaterLeak:
        return "Water Leak";
      case IssueCategory.TrafficSignal:
        return "Traffic Light";
      case IssueCategory.Roadway:
        return "Roadway";
      case IssueCategory.Sidewalk:
        return "Sidewalk";
      case IssueCategory.Drainage:
        return "Drainage";
      case IssueCategory.TreeMaintenance:
        return "Tree Maintenance";
      case IssueCategory.Graffiti:
        return "Graffiti";
      case IssueCategory.ParkMaintenance:
        return "Park Maintenance";
      case IssueCategory.StreetSign:
        return "Street Sign";
      case IssueCategory.PedestrianCrossing:
        return "Pedestrian Crossing";
      case IssueCategory.Other:
        return "Other";
      default:
        return "Unknown Category";
    }
  }

  static String? getBubbleIconPath (IssueCategory? issueCategory)
  {
        switch (issueCategory) {
      case IssueCategory.Pothole:
        return potholeBubble;
      case IssueCategory.StreetLight:
        return streetLightBubble;
      case IssueCategory.WaterLeak:
        return waterLeakBubble;
      case IssueCategory.TrafficSignal:
        return trafficLightBubble;
      case IssueCategory.Roadway:
        return roadWayBubble;
      case IssueCategory.Sidewalk:
        return sidewalkBubble;
      case IssueCategory.Drainage:
        return drainageBubble;
      case IssueCategory.TreeMaintenance:
        return treeMaintenanceBubble;
      case IssueCategory.Graffiti:
        return graffitiBubble;
      case IssueCategory.ParkMaintenance:
        return parkMatainanceBubble;
      case IssueCategory.StreetSign:
        return streetSignBubble;
      case IssueCategory.PedestrianCrossing:
        return pedestrianCrossingBubble;
      case IssueCategory.Other:
        return otherBubble;
      default:
        return null;
    }

  }
  
}