import 'package:flutter/material.dart';



class AdaptivePositioned extends StatelessWidget {

  final double top;
  final double left;
  final Widget child;


  AdaptivePositioned({this.left,this.child,this.top});
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: left,
        top: top,
        child: child);
  }
}
