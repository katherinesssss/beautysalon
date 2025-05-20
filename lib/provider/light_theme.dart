import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  colorScheme: ColorScheme.light(
      onPrimary: Colors.white, //белый цвет
      secondary: Colors.grey,//цвет текста email,password,окно с изменением темы приложения, название выделенного элемента tabbar      onSecondary: onSecondary,
      surface: Colors.black,//просто черный текст
      onSurface: Colors.lightBlueAccent //цвет кнопок
  ),
);