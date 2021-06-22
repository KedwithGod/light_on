

import 'dart:async';

import 'package:geolocator/geolocator.dart';

class LocationModel{
  bool serviceEnabled;
  LocationPermission permission;
  Position _positionValue;
  StreamSubscription<Position> _positionStream;

  //make variable public for use in the viewModel
  get positionValue=>_positionValue;



  // Test if location services are enabled.
  isServiceEnable() async{
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openAppSettings();
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    else if(serviceEnabled){
      return true;
    }


  }

  isPermissionGranted() async{
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
      else if(permission==LocationPermission.always){
        return true;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      await Geolocator.openAppSettings();
      await Geolocator.openLocationSettings();
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    if(permission==LocationPermission.always){
      return true;
    }
  }


  // function to get current location
  currentLocation() async{
    dynamic service =await isServiceEnable();
    dynamic permission =await isPermissionGranted();
    _positionValue=await Geolocator.getCurrentPosition();
    if(service==true&&permission==true){
      return _positionValue;
    }
  else{
    print(permission);
    print(service);
  }
}

  locationStream() async{
    // check for the location permission status for the location
      _positionStream = Geolocator.getPositionStream(desiredAccuracy: LocationAccuracy.best,
        intervalDuration:Duration(milliseconds: 1000)
      ).listen(
              (Position position) {
            print(position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString());
            _positionValue=position;
          });
    }


}