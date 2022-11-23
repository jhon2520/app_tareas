import 'package:flutter/material.dart';
import 'package:tareitas/consts/app_const.dart';

class PrimaryButton extends StatelessWidget {

  final void Function() onPressed;
  final Color? fillColor;
  final Color? fontColor;
  final String label;

  const PrimaryButton({Key? key, required this.onPressed, required this.label, this.fillColor, this.fontColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
        width: AppConst.primaryButtonWith,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: fillColor ?? AppConst.whiteColor,
            shape: const StadiumBorder(),
          ),
          onPressed:onPressed,
          child: Text(
            label,
            style: AppConst.fontStyle.copyWith(
              color: fontColor ?? AppConst.taksFormBackground,
            ),
          ),
        ),
      );
  }
}