
import 'package:battery/battery.dart';
import 'package:flutter/material.dart';
import 'package:phcn_status/viewModel/LandingViewModel.dart';
import 'package:phcn_status/views/Uielements/AdaptivePostionedWidget.dart';
import 'package:phcn_status/views/Uielements/Generaltextdisplay.dart';
import 'package:stacked/stacked.dart';
import 'hostelDetails.dart';

class LandingPage extends StatelessWidget {

  // custom dialog to display reset password message
  Widget customDialog(x, y, child) {
    return Align(
      alignment: Alignment(x, y),
      child: Material(
        color: Color.fromRGBO(255, 255, 255, 1.0),
        child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              width: 257,
              height: 193,
              child: child,
            )
        ),

      ),
    );
  }

// hostelWidget to set each widget on motion
  hostelWidget(
      bool lightStatus,double lightLeft,double lightTop, hostelName,double hostelLeft,double hostelTop,
      context
      ){
    return GestureDetector(
      onTap:(){
        return showDialog(context: context,
            barrierDismissible:true,
            builder: (context)=>
                HostelDetails(hostelName, '70%')
        );
      },
      child: Stack(
        children: [
          AdaptivePositioned(
              left:lightLeft ,
              top: lightTop,
              child: Container(
                width: 54,
                height: 74,
                decoration: BoxDecoration(image: DecorationImage(
                    image: AssetImage(lightStatus==true?'assets/light_on.png':
                    'assets/white.png')))
                ,
              )
          ),
          AdaptivePositioned(
            left:hostelLeft,
            top: hostelTop,
            child: GeneralTextDisplay(hostelName,
                Color.fromRGBO(242, 242, 242, 1.0), 1, 14, FontWeight.w300, hostelName)
            ,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LandingPageModel>.reactive(
      viewModelBuilder: ()=>LandingPageModel(),
      onModelReady: (viewModel)=>viewModel.initialise(),
      disposeViewModel: false,
      builder:(context,viewModel,child)=> Scaffold(
        body: Container(
          width:375 ,
          height:667,
          color: Color.fromRGBO(51, 24, 77, 1.0),
          child: Stack(
            children: [
              AdaptivePositioned(
                left:21,
                top: 37,
                child: GeneralTextDisplay('Light Status', Colors.white, 1, 20, FontWeight.bold, 'LandingPage title')
                ,
              ),
              hostelWidget(true, 91, 177, 'Akindeko hostel', 57, 254,context),
              hostelWidget(false, 227, 177, 'Abiola hostel', 203, 254,context),
              hostelWidget(false, 91, 327, 'Jadesola hostel', 60, 404,context),
              hostelWidget(true, 227, 327, 'Jibowu hostel', 200, 404,context),
              hostelWidget(false, 91, 477, 'Adeniyi hostel', 63, 562,context),
              hostelWidget(true, 227, 477, 'New hostel', 216, 562,context),
             AdaptivePositioned(
                left:255,
                top: 32,
            child: Container(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(51, 24, 77, 1.0)),

              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    dropdownColor: Color.fromRGBO(51, 24, 77, 1.0),
                    value: viewModel.value,
                    items: [
                      DropdownMenuItem(
                        child: GeneralTextDisplay('Futa', Color.fromRGBO(242, 242, 242, 1.0), 1, 13, FontWeight.w300, 'Futa'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: GeneralTextDisplay('Sheta',Color.fromRGBO(242, 242, 242, 1.0), 1, 13, FontWeight.w300,'sheta'),
                        value: 2,
                      ),
                      DropdownMenuItem(
                          child: GeneralTextDisplay('Aaua',Color.fromRGBO(242, 242, 242, 1.0), 1, 13, FontWeight.w300, 'Aaua'),
                          value: 3
                      ),
                      DropdownMenuItem(
                          child: GeneralTextDisplay('Feca',Color.fromRGBO(242, 242, 242, 1.0), 1, 13, FontWeight.w300, 'Feca'),
                          value: 4
                      )
                    ],
                    onChanged: (value) {
                        viewModel.updateSchoolType(value);
                    }),
              ),
            ),
          ),
            AdaptivePositioned(
              left: 21,
              top: 80,
              child: viewModel.batteryState==BatteryState.charging?
              GeneralTextDisplay('Charging',
                  Colors.yellow,
                  1, 12, FontWeight.w500, 'charging'):
              GeneralTextDisplay('Not charging',
                  Color.fromRGBO(51, 24, 77, 1.0),
                  1, 24, FontWeight.w500, 'not charging'),
            ),AdaptivePositioned(
              left: 21,
              top: 150,
              child:
              StreamBuilder(
                stream: Stream.fromFuture(viewModel.locationServiceAndPermission()),
                builder: (context, snapshot) {
                  if(snapshot.data==true){
                    return GeneralTextDisplay("${viewModel.positionValue}",
                        Colors.yellow,
                        1, 12, FontWeight.w500, 'charging');
                  }
                  return GeneralTextDisplay('Null',
                      Colors.yellow,
                      1, 12, FontWeight.w500, 'charging');
                }
              )
            )
            ],
          ),
        )
      ),
    );
  }
}





