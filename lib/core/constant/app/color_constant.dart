import 'package:flutter/material.dart';

class ColorConstant {
  static ColorConstant? _instace;
  static ColorConstant get instance {
    _instace ??= ColorConstant._init();
    return _instace!;
  }

  ColorConstant._init();
  final background = const Color.fromRGBO(205, 222, 242, 1);
  final tableBackground = const Color.fromRGBO(243, 238, 177, 1);
  final cell1 = const Color.fromRGBO(195, 57, 54, 1);
  final cell2 = const Color.fromRGBO(161, 55, 122, 1);
  final cell3 = const Color.fromRGBO(65, 152, 227, 1);
  final cell4 = const Color.fromRGBO(211, 54, 112, 1);
  final cell5 = const Color.fromRGBO(201, 201, 51, 1);
  final grassBottoColor = const Color.fromRGBO(177, 194, 30, 1);
      Color lineColor = const Color.fromARGB(255, 192, 183, 79);

}
