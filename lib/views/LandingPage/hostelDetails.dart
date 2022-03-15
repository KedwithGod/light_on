import 'dart:async';

import 'package:flutter/material.dart';
import 'package:phcn_status/viewModel/hostelDetailViewModel.dart';
import 'package:phcn_status/views/Uielements/AdaptivePostionedWidget.dart';
import 'package:phcn_status/views/Uielements/Generaltextdisplay.dart';
import 'package:phcn_status/views/Uielements/Generaltextfielddisplay.dart';
import 'package:stacked/stacked.dart';

class HostelDetails extends StatefulWidget {
  final String hostelName;
  final String hostelPercent;


  const HostelDetails( this.hostelName, this.hostelPercent);

  @override
  _HostelDetailsState createState() => _HostelDetailsState();
}

class _HostelDetailsState extends State<HostelDetails> {
  int lightStatus=1;
  bool enterNewHostel=false;
  TextEditingController _addNewHostel=TextEditingController();
  GlobalKey<FormState> resetKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return
      ViewModelBuilder<HostelDetailModel>.reactive(
        viewModelBuilder: ()=>HostelDetailModel(),
        builder: (context,viewModel,child) {
          return AlertDialog(
            backgroundColor: Color.fromRGBO(254, 232, 152, 1.0),
            content: Container(
              width: 257,
              height: 193,
              child: Stack(
                children: [
                  AdaptivePositioned(
                    left: 0,
                    top:0 ,
                    child: Container(
                      width: 257,
                      height: 63,
                      alignment: Alignment.center,
                      child: GeneralTextDisplay(widget.hostelName,
                          Color.fromRGBO(51, 24, 77, 1.0),
                          1, 24, FontWeight.w500, widget.hostelName),
                    )
                    ,
                  ),
                  AdaptivePositioned(
                    left: 21,
                    top: 67,
                    child: GeneralTextDisplay('% Light On',
                        Colors.black,
                        1, 15, FontWeight.w700, '% Light On')
                    ,
                  ),
                  AdaptivePositioned(
                    left: 159,
                    top: 67,
                    child: GeneralTextDisplay(widget.hostelPercent,
                        Colors.black,
                        1, 14, FontWeight.w400, widget.hostelPercent)
                    ,
                  ),
                  enterNewHostel==false?AdaptivePositioned(
                    left: 54,
                    top: 140,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          enterNewHostel=true;
                        });
                      },
                      child: GeneralTextDisplay('Add new resident/hostel',
                          Colors.black,
                          1, 12, FontWeight.w300, 'new resident'),
                    )
                    ,
                  ):
                  AdaptivePositioned(
                    left: 14,
                    top: 140,
                    child: Form(
                      key: resetKey,
                      child: Row(
                        children: [
                          GeneralTextField(
                              TextInputType.text,
                              _addNewHostel,
                              'New hostel',
                              'Add a new Hostel',
                              'name',
                              1,
                              46,150
                          ),
                          IconButton(icon: Icon(Icons.done,size: 10,color: Colors.green,), onPressed: (){
                            // timer to display the done button
                            Timer(Duration(seconds: 2), (){
                              return AdaptivePositioned(
                                left: 42,
                                top: 200,
                                child: GeneralTextDisplay('Hostel Added',
                                    Colors.green,
                                    1, 15, FontWeight.w500, 'Hostel added')
                                ,
                              );
                            });
                            // timer to reload the add new hostel text
                            Timer(Duration(seconds: 3), (){
                              setState(() {
                                enterNewHostel=false;
                              });
                            });
                          })
                        ],
                      ),
                    ),
                  ),
                  AdaptivePositioned(
                    left: 21,
                    top: 97,
                    child: GeneralTextDisplay('Change Status',
                        Colors.black,
                        1, 15, FontWeight.w700, 'Change Status')
                    ,
                  ),
                  AdaptivePositioned(
                    left: 160,
                    top: 74,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          dropdownColor: Colors.white,
                          value: lightStatus,
                          items: [
                            DropdownMenuItem(
                              child: GeneralTextDisplay('Light On',
                                  Colors.black,
                                  1, 13, FontWeight.w300, 'Light on'),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: GeneralTextDisplay('Light off',
                                  Colors.black, 1, 13,
                                  FontWeight.w300,'Light off'),
                              value: 2,
                            ),

                          ],
                          onChanged: (value) {
                            setState(() {
                              lightStatus= value;
                            });
                          }),
                    ),
                  ),

                ],
              ),
            ),
          );
        }
      );}}