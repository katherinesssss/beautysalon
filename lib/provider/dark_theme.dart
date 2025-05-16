import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  colorScheme: ColorScheme.dark(
      onPrimary: Colors.white, //белый цвет
      secondary: Colors.white10,//цвет текста email,password,окно с изменением темы приложения, название выделенного элемента tabbar      onSecondary: onSecondary,
      surface: Colors.black,//просто черный текст
      onSurface: Colors.deepPurple.shade900 //цвет кнопок
  ),
);