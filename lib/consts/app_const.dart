
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConst{
  static const Color backgrounColor = Color.fromRGBO(52, 77, 100, 1);
  static const Color taksBackgroundColor = Colors.white;
  static const Color whiteColor = Colors.white;
  static const Color floatingActionButton = Color(0xff6ECCAF);
  static const Color taksFormBackground = Color(0xff282A3A);
  static const Color deleteColor = Color(0xff9C254D);
  static  TextStyle fontStyleBold = GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500);
  static  TextStyle fontStyle = GoogleFonts.poppins(fontSize: 10);
  static const String labelTitle = "T i t l e";
  static const String labelDescription = "D e s c r i p t i o n";
  static const String labelState = "S t a t e";
  static const String labelAdd = "A d d";
  static const String labelCancel = "C A N C E L";
  static  InputBorder formFieldBorder = OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: AppConst.whiteColor));
}