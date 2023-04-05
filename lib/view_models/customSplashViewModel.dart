import 'package:flutter/cupertino.dart';
import 'package:kisaan_app/services/FirebaseService.dart';
import 'package:location/location.dart';

class CustomSplashViewModel with ChangeNotifier {
  Location location = Location();

  PermissionStatus? _permissionGranted;
  bool checkUserLoggedIn() {
    if (FirebaseService().user != null) {
      return true;
    } else {
      return false;
    }
  }


  void getLocationPermission()async{
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }
}
