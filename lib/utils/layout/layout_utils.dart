import 'package:flutter/material.dart';
import 'package:tareitas/utils/enums/custom_spacer_enum.dart';

class LayoutUtils{

  static double getCustomSpacerSize(CustomSpacerSizeEnum customSpacerSizeEnum){
    return customSpacerSizeEnum.size;
  }

  static SnackBar showSnackBar(GlobalKey key){

    return SnackBar(
      key: key ,
      content: const Text("oeoeoeo")
    ); 
  }

}