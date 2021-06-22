import 'package:flutter/material.dart';

class GeneralTextDisplay extends StatelessWidget {
  final String inputText;
  final double textFontSize;
  final FontWeight textFontWeight;
  final int noOfTextLine;
  final String textSemanticLabel;
  final Color textColor;

  GeneralTextDisplay(this.inputText,this.textColor, this.noOfTextLine, this.textFontSize,
      this.textFontWeight, this.textSemanticLabel);

  @override
  Widget build(BuildContext context) {
    Size dynamicSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Text(
        inputText,
        style: TextStyle(
          color: textColor,
          fontSize:
              dynamicSize.height*(textFontSize/667),
          fontWeight: textFontWeight,
        ),
        maxLines: noOfTextLine,
        semanticsLabel: textSemanticLabel,
        textAlign: TextAlign.left,
      ),
    );
  }
}
