import 'package:flutter/material.dart';
import 'package:tareitas/utils/enums/custom_spacer_enum.dart';
import 'package:tareitas/utils/layout/layout_utils.dart';

class CustomSpacer extends StatelessWidget {

  final bool isHorizontal;
  final CustomSpacerSizeEnum size;


  const CustomSpacer({Key? key, required this.size, this.isHorizontal = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isHorizontal){
      return SizedBox(width: LayoutUtils.getCustomSpacerSize(size),);
    }else{
      return SizedBox(height: LayoutUtils.getCustomSpacerSize(size),);
    }
    
  }
}