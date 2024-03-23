import 'package:flutter/material.dart';

class ScreenSize{
  static double Height(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
  static double Width(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
}