import 'package:beautysalon/my_drawer.dart';
import 'package:beautysalon/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeProvider>().isDarkMode;
        return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          //optional, we have drawer, so that part we can omit and the menu insert automatically
          // leading: Builder(
          //   builder: (context) {
          //     return IconButton(onPressed: (){
          //       }, icon: Icon(Icons.menu));
          //   }
          // ),
          title: Text(
            "LA BELLE",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Delius-Regular',
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          centerTitle: true,
          actions: [ //список виджетов, которые отображаются в конце appbar
              IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart'),
                icon: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).colorScheme.surface,
                    ),
                  )
              ],
              iconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.surface, // Указываем свойство color for humburgermenu
              ),
              ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex, //обязательно использовать, поскольку он обновляет цвет кнопки
          // и передается обязательно(index==currentIndex) - selectedItemColor
            onTap: (index){
            setState(() {
              _currentIndex = index;
            });
            switch(index) {
              case 0:
                Navigator.pushNamed(context, '/home');
                break;
              case 1:
                Navigator.pushNamed(context, '/services');
            }
            },
          selectedItemColor: Theme.of(context).colorScheme.onPrimary,
          unselectedItemColor: Theme.of(context).colorScheme.inversePrimary,
            items: [
              BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: "Services", icon: Icon(Icons.list_alt)),
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
            child:
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'lib/assets/lotos.png',
                    width: 100,
                    height: 100,
                  ),
                ),
            ),
    );
  }
}
