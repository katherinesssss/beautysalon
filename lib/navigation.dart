import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Главная',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Аккаунт',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.design_services),
          label: 'Услуги',
        ),
      ],
      currentIndex: 2, // Указываем, что "Услуги" выбраны по умолчанию (индекс 2)
      selectedItemColor: Colors.blue, // Цвет выбранного элемента
      unselectedItemColor: Colors.grey, // Цвет невыбранных элементов
      onTap: (int index) {
        // Здесь можно добавить логику для навигации
        // Например, Navigator.pushReplacementNamed(context, '/home')
      },
    );
  }
}