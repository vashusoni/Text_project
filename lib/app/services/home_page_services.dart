import 'dart:convert';
import 'dart:developer';

import 'package:test_projects/app/model/data_model.dart';
import 'package:flutter/services.dart' as rootBoundle;

class HomePageServices {
  Future<List<DataModel>> getJsonData() async {
    final jasonData =
        await rootBoundle.rootBundle.loadString("assets/json_data.json");

    final list = json.decode(jasonData) as List<dynamic>;

    List<DataModel> datamodel = list.map((e) => DataModel.fromJson(e)).toList();

    return datamodel;
  }
}
