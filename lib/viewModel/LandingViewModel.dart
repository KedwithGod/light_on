import 'dart:async';

import 'package:battery/battery.dart';
import 'package:geolocator/geolocator.dart';
import 'package:phcn_status/Models/location.dart';
import 'package:phcn_status/viewModel/baseModel.dart';

class LandingPageModel extends BaseModel{

  //battery subscription: to know when the phone is charging or not

  //battery variables
  final Battery _battery = Battery();
  BatteryState _batteryState;
  get batteryState=>_batteryState; //make the private variable available for use in the view
  StreamSubscription<BatteryState> _batteryStateSubscription;

  // Location variables
  LocationModel _locationModel =LocationModel();
  get positionValue=>_locationModel.positionValue;

  initialise(){
    //battery subscription
    _batteryStateSubscription =
        _battery.onBatteryStateChanged.listen((BatteryState state) {
            _batteryState = state;
            notifyListeners();
            print(state);
          });
    //enable location service
    _locationModel.isServiceEnable();
    //ask for permission to use location
    _locationModel.isPermissionGranted();
    //location subscription
  _locationModel.locationStream();
  }

// dropdown function
  int _value = 1; //dropdown value
  get value=>_value; //dropdown value made public

  // updating dropdown for school type
  updateSchoolType(newValue){
    _value=newValue;
    notifyListeners();
  }

  // subscribe to stream of location service enable and permission
  locationServiceAndPermission()async{
     return _locationModel.serviceEnabled==true||_locationModel.permission==LocationPermission.always? true:null;

    // TODO: integrate the request of if there is light or not into percentage
    // TODO:add a flutter local notification to the app to pop up when it notice you are charging\
    // TODO: find a work around the location to make the user know why he or she is directed to on location and
  }
}