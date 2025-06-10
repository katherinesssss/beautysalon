import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int? _currentIndex;
  final _isItemSelected = false;
  final List<String> routes = ['/home', '/services', '/back'];  // Теперь 3 элемента
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("CART",
            style: TextStyle(
              fontFamily: 'Delius-Regular'
            ),
          ),
        ),
      backgroundColor: Colors.indigoAccent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex ?? 0,
        // и передается обязательно(index==currentIndex) - selectedItemColor
    onTap: (index) {
      setState(() {
      _currentIndex = index;  // Обновляем индекс только для Home/Services
      });
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/home');
          break;
        case 1:
          Navigator.pushNamed(context, '/services');
          break;
        case 2:
          Navigator.pushNamed(context, '/home');
      }

        },
        selectedItemColor: _isItemSelected ? Colors.grey : Colors.white,
        unselectedItemColor: Colors.white,

        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home),),
          BottomNavigationBarItem(label: "Services", icon: Icon(Icons.list_alt)),
          BottomNavigationBarItem(label: "Back", icon: Icon(Icons.arrow_back_ios_new))
        ],
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
      ),
    );
  }
}
