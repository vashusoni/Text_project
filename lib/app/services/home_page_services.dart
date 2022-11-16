import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:test_projects/app/model/data_model.dart';
import 'package:flutter/services.dart' as rootBoundle;

class HomePageServices extends ChangeNotifier {
  Map _alphabetMap = {};
  Map _digitMap = {};
  int _selectingCheckBox = 0;
  int _selectingAlphabetCheckBox = 0;
  int _selectingDigitCheckBox = 0;

  Map get alphabetMap=>_alphabetMap;
  Map get digitMap=>_digitMap;
  int get selectingCheckBox=>_selectingCheckBox;
  int get selectingAlphabetCheckBox=>_selectingAlphabetCheckBox;
  int get selectingDigitCheckBox=>_selectingDigitCheckBox;

  Future<List<DataModel>> getJsonData() async {
    final jasonData =
        await rootBoundle.rootBundle.loadString("assets/json_data.json");

    final list = json.decode(jasonData) as List<dynamic>;

    List<DataModel> datamodel = list.map((e) => DataModel.fromJson(e)).toList();

    return datamodel;
  }
}
