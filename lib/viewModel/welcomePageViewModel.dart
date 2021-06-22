import 'dart:async';

import 'package:flutter/material.dart';
import 'package:phcn_status/viewModel/baseModel.dart';
import 'package:phcn_status/views/LandingPage/LandingPage.dart';

class WelcomePageViewModel extends BaseModel{
  // function to run the timer for the welcome page
   initialise(context){
    return Timer(Duration(seconds: 5), (){
      Navigator.push(context,MaterialPageRoute(builder: (context)=>LandingPage()));
    });
  }
}