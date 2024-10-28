import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:municipal/model/Quickreport.dart';
import 'package:dartz/dartz.dart';
class QuickReportRepo
{

  Future<Either<String,Quickreport>> createReport (
  double latitude,
  double longitude,
  String typeOfReport) async {
    try {
      final roundedLat = latitude.toStringAsFixed(4); 
      final roundedLong = longitude.toStringAsFixed(4); 

      final existingReport = (await Amplify.DataStore.query(
        QuickReportRepo()
      ))

  }


}
