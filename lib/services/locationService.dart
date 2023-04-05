import 'package:location/location.dart';

class LocationService{
  Location location = Location();
  bool _serviceEnabled=false;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  void initLocation()async{
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
  }
  Future<void> getLocation()async{
    _locationData = await location.getLocation();
    print(_locationData);
    // return _locationData;
  }
}