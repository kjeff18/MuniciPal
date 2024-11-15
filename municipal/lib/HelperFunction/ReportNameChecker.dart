import 'package:municipal/DesingContstant.dart';

class ReportNameChecker {

  Map<String,String> _ReportCheker ={
    "ph": pothole,
    'st': streetlight,
    'wt': waterLeak,
    'tl': trafficLight,
    'rw': roadway,
    'sw': sidewalk,
    'ss': streetSign,
    'dr': drainage,
    'pm': parkMatainance,
    'tm': treeMaintenance,
    'pc': pedestrianCrossing,
    'ss': streetSign,
    'gr': graffiti,
    'ot': more,
  };

  String getReportName(String code){
    return _ReportCheker[code] ?? 'Unknow';
  }


  
}