import 'dart:async';

import 'package:flutter/material.dart';
import 'package:phcn_status/viewModel/welcomePageViewModel.dart';
import 'package:phcn_status/views/Uielements/AdaptivePostionedWidget.dart';
import 'package:phcn_status/views/Uielements/Generaltextdisplay.dart';
import 'package:stacked/stacked.dart';
import '../Models/location.dart';
import 'LandingPage/LandingPage.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomePageViewModel>.reactive(
      viewModelBuilder: ()=>WelcomePageViewModel(),
      onModelReady: (viewModel)=>viewModel.initialise(context),
      disposeViewModel: true,
      builder:(context,viewModel,child)=>Scaffold(
        body: Container(
          width:375 ,
          height:667,
          color: Color.fromRGBO(51, 24, 77, 1.0),
          child: Stack(
            children: [
              AdaptivePositioned(
                left: 151,
                top: 204,
                child: Container(
                  width: 55,
                    height: 74,
               decoration: BoxDecoration(
                   image: DecorationImage(image: AssetImage('assets/white.png')))
                  ,
                   ),
              ),
              AdaptivePositioned(
                  left: 125,
                  top: 296,
                  child: GeneralTextDisplay('Light Status', Colors.white, 1, 18, FontWeight.w700, 'Light Status')),
            AdaptivePositioned(
                  left: 104,
                  top: 335,
                  child: GeneralTextDisplay(
                      'Be the change you want',
                      Color.fromRGBO(254, 189, 152, 1.0), 1, 13,
                      FontWeight.w300, 'subtitle')),
            ],
          ),
        ),
      ),
    );
  }
}
