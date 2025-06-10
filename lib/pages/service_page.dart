import 'package:beautysalon/components/tab_bar.dart';
import 'package:flutter/material.dart';
import '../my_drawer.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: Text(
            "LA BELLE",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Delius-Regular',
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
              icon: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  'lib/assets/addtocart.png',
                  height: 30,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.lightBlueAccent,
                Colors.cyan,
                Colors.blueAccent.shade100,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: MyTabBar(),
                  ),
                ),
            ),
          ),
    );
  }
}