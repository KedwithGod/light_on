import 'baseModel.dart';

class HostelDetailModel extends BaseModel{

  //updating values from dropdown and percent value
  int lightStatus=1;
  bool enterNewHostel=false;

  updateLightStatus(int value){
    lightStatus=value;
    notifyListeners();
  }

  enterNewHostelDetails(value){
    enterNewHostel=value;
    notifyListeners();
  }
}