import 'package:flutter/material.dart';

class LocationModalViewModel with ChangeNotifier {
  String _countryVal = "";

  String get countryVal => _countryVal;

  set countryVal(String countryVal) {
    _countryVal = countryVal;
    notifyListeners();
  }

  String? _stateVal;

  String? get stateVal => _stateVal;

  set stateVal(String? stateVal) {
    _stateVal = stateVal;
    notifyListeners();
  }

  String? _cityVal;

  String? get cityVal => _cityVal;

  set cityVal(String? cityVal) {
    _cityVal = cityVal;
    notifyListeners();
  }
}
