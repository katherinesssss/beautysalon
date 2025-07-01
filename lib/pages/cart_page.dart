import 'package:beautysalon/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int? _currentIndex;
  final _isItemSelected = false;
  final List<String> routes = ['/home', '/services', '/back']; 
  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeProvider>().isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("CART",
            style: TextStyle(
              fontFamily: 'Delius-Regular',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
       backgroundColor: Theme.of(context).colorScheme.primary,
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
          selectedItemColor: _isItemSelected ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.inversePrimary,
          unselectedItemColor:  Theme.of(context).colorScheme.inversePrimary,
      
          items: [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home),),
            BottomNavigationBarItem(label: "Services", icon: Icon(Icons.list_alt)),
            BottomNavigationBarItem(label: "Back", icon: Icon(Icons.arrow_back_ios_new))
          ],
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body:  Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: isDarkMode?[Colors.indigo, Colors.deepPurple, Colors.purple.shade200]:[Colors.lightBlueAccent, Colors.cyan, Colors.blueAccent.shade100] ,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                ),
              ),
        ),
    );
  }
}
