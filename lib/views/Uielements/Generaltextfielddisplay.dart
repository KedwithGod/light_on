import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class GeneralTextField extends StatelessWidget {
  final TextInputType keyInputType;
  final TextEditingController textFieldController;
  final int textFieldLineSpan;
  final String textFieldLabel;
  final String textFieldHint;
  final dynamic functionValue;
  final double height;
  final double width;


  const GeneralTextField(
    this.keyInputType,
    this.textFieldController,
    this.textFieldLabel,
    this.textFieldHint,
    this.functionValue,
    this.textFieldLineSpan, this.height, this.width,
  );

  int isValidPhoneNumber(String input) {
    var potentialNumber = int.tryParse(input);
    return potentialNumber;
  }

  bool isValidPassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool isValidEmail(String input) {
    final RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:height, /*choosePage=='Login'?dynamicSize.height(64 / 667):choosePage=='tradePage'?dynamicSize.height(28 / 667):dynamicSize.height(58 / 667),*/
      width:width, /*choosePage=='tradePage'?dynamicSize.width(142 / 375):dynamicSize.width(314 / 375),*/
      child: TextFormField(

        cursorColor: Colors.black,
        keyboardType: keyInputType,
        controller: textFieldController,
        maxLines: textFieldLineSpan,
        validator: (value) {
          if (functionValue == 'email') {
            return isValidEmail(value)
                ? null
                : 'Please enter a valid email address';
          }
          else if (functionValue=='password'){
            return value.isEmpty? 'password cannot be null':value.length<8?
            'Password length is less than 8':null;
          }
          else if (functionValue=='NIN'){
            var nin = int.tryParse(value);
            if (nin == null && nin<8){
              return 'Nin value is invalid';
            }
          }
          else if (functionValue == 'name') {
            return value.isEmpty ? 'Value  is required' : null;
          }
          else if (functionValue=='workPhone' || functionValue=='mobilePhone'){
            var potentialNumber = int.tryParse(value);
            if (potentialNumber == null) {
              return 'Enter valid phone number';
          }

          return null;
        }
          return null;
          },
        style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500),
        autocorrect: true,
        decoration: InputDecoration(
            labelText: '$textFieldLabel',
            hintStyle: TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.w500),
            hintText: '$textFieldHint',
            labelStyle: TextStyle(
                fontSize: 14,
                color:  Colors.black,
                fontWeight: FontWeight.w400),
            contentPadding: EdgeInsets.fromLTRB(
                20,2,2,2),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color:Colors.black,
                    width: 1.0,
                    style: BorderStyle.solid),
                borderRadius:
                BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.blueGrey,
                    width: 1.0,
                    style: BorderStyle.solid),
                borderRadius:
                    BorderRadius.circular(10)), enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                    style: BorderStyle.solid),
                borderRadius:
                    BorderRadius.circular(10))),
      ),
    );
  }
}
