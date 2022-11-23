import 'package:flutter/material.dart';
import 'package:tareitas/consts/app_const.dart';

class SecondaryButton extends StatelessWidget {

  final Color? fillColor;
  final Color? fontColor;
  final Color? borderColor;
  final String label;
  final void Function() onPressed;


  const SecondaryButton({Key? key, this.fillColor, this.fontColor,this.borderColor, required this.label, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConst.secondaryButtonWith,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: fillColor ?? AppConst.backgrounColor,
            shape: const StadiumBorder(),
            side: BorderSide(
                color: borderColor ?? AppConst.whiteColor.withOpacity(0.6))),
        onPressed: onPressed,
        child: Text(
          label,
          style: AppConst.fontStyle.copyWith(
            color: fontColor ?? AppConst.whiteColor,
          ),
        ),
      ),
    );    
  }                  
}