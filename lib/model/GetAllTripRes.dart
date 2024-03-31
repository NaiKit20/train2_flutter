// To parse this JSON data, do
//
//     final getAllTripRes = getAllTripResFromJson(jsonString);

import 'dart:convert';

List<GetAllTripRes> getAllTripResFromJson(String str) =>
    List<GetAllTripRes>.from(
        json.decode(str).map((x) => GetAllTripRes.fromJson(x)));

String getAllTripResToJson(List<GetAllTripRes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllTripRes {
  int idx;
  dynamic name;
  dynamic country;
  int destinationid;
  String coverimage;
  String detail;
  int price;
  int duration;

  GetAllTripRes({
    required this.idx,
    required this.name,
    required this.country,
    required this.destinationid,
    required this.coverimage,
    required this.detail,
    required this.price,
    required this.duration,
  });

  factory GetAllTripRes.fromJson(Map<String, dynamic> json) => GetAllTripRes(
        idx: json["idx"],
        name: json["name"],
        country: json["country"],
        destinationid: json["destinationid"],
        coverimage: json["coverimage"],
        detail: json["detail"],
        price: json["price"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "idx": idx,
        "name": name,
        "country": country,
        "destinationid": destinationid,
        "coverimage": coverimage,
        "detail": detail,
        "price": price,
        "duration": duration,
      };
}
