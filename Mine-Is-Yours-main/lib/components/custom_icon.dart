import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget customImageIcon(
    {String? folderPath,
    @required String? imageName,
    String? imagePath,
    double? width,
    double? height,
    color}) {
  return Image.asset(
    'assets/${folderPath ?? "images"}/$imageName.${imagePath ?? "png"}',
    color: color,
    width: width ?? 30,
    height: height ?? 25,
  );
}

Widget customImageIconSVG({@required String? imageName,Color? color}) {
  return SvgPicture.asset(
    'assets/svgs/$imageName.svg',
    color: color,
  );
}