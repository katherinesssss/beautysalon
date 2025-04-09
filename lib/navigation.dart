import 'package:beautysalon/pages/account_page.dart';
import 'package:beautysalon/pages/user_main_page.dart';
import 'package:flutter/material.dart';

import 'consumers.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'home',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.design_services),
          label: 'service',
        ),
      ],
      //selectedItemColor: Colors.blue, // Цвет выбранного элемента
      //unselectedItemColor: Colors.grey, // Цвет невыбранных элементов
    currentIndex: 0,

    onTap: (int index) {
    Widget newPage; // Определяем переменную для виджета нового экрана

    switch (index) {
    case 0:
    newPage = const UserMainPage(); // Замените на ваш первый экран

    break;
    case 1:
    newPage = const AccountPage(); // Замените на ваш второй экран

    break;
    case 2:
    newPage = const ServiceSelection(); // Замените на ваш третий экран
    break;
    default:
      newPage = const UserMainPage(); // Замените на экран по умолчанию (если индекс не 0, 1 или 2)
      break;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => newPage),
    );



  }
    );
  }
}