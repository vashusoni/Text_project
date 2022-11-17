import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:test_projects/app/model/data_model.dart';
import 'package:flutter/services.dart' as rootBoundle;

class HomePageServices extends ChangeNotifier {
  Map<dynamic, bool> _alphabetMap = {};
  Map<dynamic, bool> _digitMap = {};
  int _selectingEachSideCheckBox = 0;
  int _selectingAlphabetCheckBox = 0;
  int _selectingTotalCheckBox = 0;
  int _selectingDigitCheckBox = 0;
  int _alphaValue=0;
  int _digitValue=0;

  String _message = 'please select each side Check Box';
  bool _messageBgColor = true;
  int _limitedTotalCheckBox = 0;

  int get alphaValue=>_alphaValue;
  int get digitValue=>_digitValue;

  int get selectingTotalCheckBox => _selectingTotalCheckBox;

  int get limitedTotalCheckBox => _limitedTotalCheckBox;

  bool get messageBgColor => _messageBgColor;

  Map get alphabetMap => _alphabetMap;

  Map get digitMap => _digitMap;

  int get selectingEachSideCheckBox => _selectingEachSideCheckBox;

  int get selectingAlphabetCheckBox => _selectingAlphabetCheckBox;

  int get selectingDigitCheckBox => _selectingDigitCheckBox;

  String get message => _message;
  void setAlpha(int value){
    _alphaValue=value;
    notifyListeners();
  }

  void setDigit(int value){
    _digitValue=value;
    notifyListeners();
  }

  setLimitedTotalCheckBox(int value) {
    _limitedTotalCheckBox = value * 2;
    notifyListeners();
  }

  void setMessageBgColors(bool value) {
    _messageBgColor = value;
    notifyListeners();
  }

  void setAlphaMap({dynamic key}) {
    if (_alphabetMap[key] == true) {
      _alphabetMap[key] = false;
      notifyListeners();
    } else {
      _alphabetMap[key] = true;
      notifyListeners();
    }
  }

  void setDigitMap({dynamic key}) {
    if (digitMap[key] == true) {
      digitMap[key] = false;
      notifyListeners();
    } else {
      digitMap[key] = true;
      notifyListeners();
    }
  }

  void setMessage(String message) {
    _message = message;
    notifyListeners();
  }

  void setDigitCheckBox(int value) {
    _selectingDigitCheckBox = value;
    notifyListeners();
  }

  void seTotalCheckBox(int value) {
    _selectingTotalCheckBox = value * 2;
    notifyListeners();
  }

  void setEachSideCheckBox(int value) {
    _selectingEachSideCheckBox = value;
    notifyListeners();
  }

  void setAlphabetCheckBox(int value) {
    _selectingAlphabetCheckBox = value;
    notifyListeners();
  }

  Future<List<DataModel>> getJsonData() async {
    final jasonData =
        await rootBoundle.rootBundle.loadString("assets/json_data.json");
    final list = json.decode(jasonData) as List<dynamic>;
    _alphabetMap.clear();
    _digitMap.clear();
    List<DataModel> dataModel = list.map((e) => DataModel.fromJson(e)).toList();

    for (int i = 0; i <= selectingEachSideCheckBox; i++) {
      _alphabetMap[list[i]["alpha"]] = false;
      _digitMap[list[i]["digit"]] = false;
    }

    return dataModel;
  }
}
