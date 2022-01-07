import 'package:demo/models/industry.dart';

class IndustryResponse {
 late String error;
 late String success;
 late List<Industry> industries;

  IndustryResponse({
    required this.error,
    required this.success,
     required this.industries});

  IndustryResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    success = json['success'];
    if (json['data'] != null) {
      industries = List<Industry>.empty(growable: true);
      json['data'].forEach((v) {
        industries.add(Industry.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['error'] = error;
    data['success'] = success;
      data['data'] = industries.map((v) => v.toJson()).toList();
    return data;
  }
}