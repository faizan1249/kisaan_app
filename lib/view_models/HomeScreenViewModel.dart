import 'package:flutter/cupertino.dart';
import 'package:kisaan_app/services/locationService.dart';
import 'package:location/location.dart';

class HomeScreenViewModel with ChangeNotifier{
  late LocationData _locationData;

  set setLocationData(LocationData newVal){
    _locationData = newVal;
    notifyListeners();
  }
  LocationData get getLocationData => _locationData;


  getLocation()async{
    LocationService().getLocation();
  }




  
}