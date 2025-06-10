import 'package:beautysalon/my_drawer.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
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
              fontFamily: 'Delius-Regular'
            ),
          ),
          centerTitle: true,
          actions: [ //список виджетов, которые отображаются в конце appbar
              IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/cart');
                },
                icon: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset('lib/assets/addtocart.png',
                    height: 30,),
                ),
                ),
              ],
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
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: "Services", icon: Icon(Icons.list_alt)),
            ],
          backgroundColor: Colors.indigoAccent,
        ),
          body:  Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.lightBlueAccent, Colors.cyan, Colors.blueAccent.shade100],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              ),
            ),
            child:
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'lib/assets/lotos.png',
                    width: 80,
                    height: 80,
                  ),
                ),
            ),
        ),
    );
  }
}
