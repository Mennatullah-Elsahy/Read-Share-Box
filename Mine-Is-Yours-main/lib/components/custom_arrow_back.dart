// import 'package:flutter/material.dart';

// import '../core/localization.dart';
// import 'custom_icon.dart';

// class ArrowBack extends StatelessWidget{
//   final Color? color ;
//   final bool reverse;
//   ArrowBack({this.color,this.reverse = false});
//   @override
//   Widget build(BuildContext context) {
//     return currentLang() == "ar"? customImageIconSVG(imageName: reverse?"left":"right",color: color??Colors.black):
//     customImageIconSVG(imageName: reverse?"right":"left",color: color??Colors.black);
//   }

// }

// class ArrowBackIos extends StatelessWidget{
//   final Color color;
//   ArrowBackIos({this.color = Colors.white});
//   @override
//   Widget build(BuildContext context) {
//     return currentLang() != "ar"?
//     customImageIconSVG(imageName: "ios-right",color: color):
//     customImageIconSVG(imageName: "ios-left",color: color);
//   }

// }