import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
        title: Text(
          "LA BELLE",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Delius-Regular'
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart), color: Colors.black,)
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: kBottomNavigationBarHeight, // Стандартная высота
          child: Center( // Выравниваем по центру
            child: IconButton(
              icon: Icon(Icons.list_alt),
              onPressed: () {},
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.cyan, Colors.blueAccent.shade100],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          ),
        ),
        child:
            Image.asset(
              'lib/assets/lotos.png',
              width: 10,
              height: 60,
            ),

        ),
      );
  }
}
