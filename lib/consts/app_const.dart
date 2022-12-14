
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tareitas/utils/enums/enum.dart';

class AppConst{
  static const Color backgrounColor = Color.fromRGBO(52, 77, 100, 1);
  static const Color taksBackgroundColor = Colors.white;
  static const Color whiteColor = Colors.white;
  static const Color floatingActionButton = Color.fromARGB(255, 74, 188, 152);
  static const Color taksFormBackground = Color(0xff282A3A);
  static const Color deleteColor = Color(0xff9C254D);
  static const Color editColor = Color(0xff59C1BD);
  static const Color errorColor = Color(0xff9C254D);
  static const Color succesColor = Color(0xff59CE8F);
  static const Color infoColor = Color(0xff256D85);
  static const Duration durationSnackbar = Duration(seconds: 1);

  static const double primaryButtonWith = 100;
  static const double secondaryButtonWith = 100;
  static const double appRadius = 20.0; 
  static  double fontSizeH1 = FontSizeEnum.h1.size;
  static  double fontSizeH2 = FontSizeEnum.h2.size;
  static  double fontSizeH3 = FontSizeEnum.h3.size;
  static  double fontSizeH4 = FontSizeEnum.h4.size;
  static  double fontSizeH5 = FontSizeEnum.h5.size;
  static  TextStyle fontStyleBold = GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500);
  static  TextStyle fontStyle = GoogleFonts.poppins(fontSize: 10);
  static const String labelTitle = "T i t l e";
  static const String labelDescription = "D e s c r i p t i o n";
  static const String labelState = "S t a t e";
  static const String labelStateCard = "State";
  static const String labelLimitDate = "Deadline";
  static const String labelDate = "D e a d l i n e";
  static const String labelAdd = "A d d";
  static const String labelEdit = "E d i t";
  static const String labelCancel = "C a n c e l";
  static const String labelCreateTaks = "C r e a t e  T a s k";
  static const String labelEditTask = "E d i t  T a s k";
  static const String labelNoTasks = "There's no registered task";
  static const String labelCreateTasks = "Crate one!";
  static const String labelSelectAColor = "Select a color";
  static const String labelButtonDone = "D o n e";
  static const String labelCamposFaltantes = 'There are empty fields. Fill in!';
  static  InputBorder formFieldBorder = OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: AppConst.backgrounColor));

            
}