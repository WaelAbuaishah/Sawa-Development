import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'dart:io';


class CampsInfo {
  DateTime lastVisit;
  String latitude;
  String campName;
  String campCode;
  String location;
  String longitude;
  int tentsCount;
  int familyCounts;
  String needs;

  CampsInfo({
    this.latitude,
    this.location,
    this.longitude,
  this.campCode,
    this.campName,
    this.familyCounts,
    this.lastVisit,
    this.needs,
    this.tentsCount
  });

  factory CampsInfo.fromDoc(DocumentSnapshot documentSnapshot) {
    var json = documentSnapshot.data;
    return CampsInfo(

      latitude: json["latitude"] == null ? null : json["latitude"],
      location: json["location"] == null ? null : json["location"],
      longitude: json["longitude"] == null ? null : json["longitude"],
      campCode: json["campCode"] == null ? null: json["campCode"],
      campName: json["campName"] == null ? null: json["campName"],
      familyCounts: json["familyCounts"] == null ? null: json["familyCounts"],
      lastVisit: json["lastVisit"] == null ? null: parseTime(json["lastVisit"]),
      needs: json["needs"] == null ? null: json["needs"],
      tentsCount: json["tentsCount"] == null ? null: json["tentsCount"],

    );
  }

  Map<String, dynamic> toJson() =>
      {
        "latitude": latitude == null ? "" : latitude,
        "location": location == null ? "" : location,
        "longitude": longitude == null ? "" : longitude,
        "campName": campName == null ? "" : campName,
        "campCode": campCode == null ? "" : campCode,
        "familyCounts": familyCounts == null ? "" : familyCounts,
        "lastVisit": lastVisit == null ? DateTime.now() : lastVisit,
        "needs": needs == null ? "" : needs,
        "tentsCount": tentsCount == null ? "" : tentsCount,

      };
}
DateTime parseTime(dynamic date) {
  return Platform.isIOS
      ? (date as Timestamp).toDate()
      : (date as Timestamp).toDate();
}