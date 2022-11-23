import 'dart:math';
import 'package:flutter/material.dart';

class ColorsUtils{

  static Color  getRandomColor(){

    List<Color> colors = [
      const Color(0XFFD989B5),
      const Color(0xffDEBACE),
      const Color(0xff497174),
      const Color(0xff8D72E1),
      const Color(0xff6B728E),
      const Color(0xffA3C7D6),
      const Color(0xff81C6E8),
      const Color(0xff7978FF)
    ];

    Random random = Random();
    int index = random.nextInt(colors.length);
    return colors[index];

  }

}