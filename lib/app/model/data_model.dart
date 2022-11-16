// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

List<DataModel> dataModelFromJson(String str) => List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));

String dataModelToJson(List<DataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataModel {
  DataModel({
    required this.alpha,
    required this.digit,
  });

  String alpha;
  String digit;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    alpha: json["alpha"],
    digit: json["digit"],
  );

  Map<String, dynamic> toJson() => {
    "alpha": alpha,
    "digit": digit,
  };
}
