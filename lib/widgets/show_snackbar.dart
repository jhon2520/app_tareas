import 'package:flutter/material.dart';
import 'package:tareitas/consts/app_const.dart';
import 'package:tareitas/utils/enums/tipo_snackbar_enum.dart';

class ShowSnackBar{

  static void showSnackBar(BuildContext context, TipoSnakBarEnum tipoSnakBarEnum, String mensaje){

    Color backgroundColor = AppConst.backgrounColor;

    switch (tipoSnakBarEnum) {
      case TipoSnakBarEnum.error:
        backgroundColor = AppConst.errorColor;
        break;
      case TipoSnakBarEnum.info:
        backgroundColor = AppConst.infoColor;
        break;
      case TipoSnakBarEnum.success:
        backgroundColor = AppConst.succesColor;
        break;
      default:
        backgroundColor = AppConst.backgrounColor;
        break;
    }

    final SnackBar snackBar = SnackBar(
      backgroundColor: backgroundColor,
      content: Text(mensaje),
      duration: AppConst.durationSnackbar,
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }

}