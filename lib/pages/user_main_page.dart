import 'package:flutter/material.dart';
import 'package:beautysalon/consumers.dart';

import '../navigation.dart';

class UserMainPage extends StatelessWidget {
  const UserMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(decoration: BoxDecoration(gradient: LinearGradient(
        colors: [Color.fromARGB(255, 95, 182, 232), Color.fromARGB(255, 102, 71, 213)],
    stops: [0.2, 0.8]),
    ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25, bottom: 25),
        child: SafeArea(
          child: Column(
            children: [
              // header
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Icon(
                  Icons.favorite_outline_outlined,
                  size: 80,
                ),
              ),

              //home list tile
              ListTile(
                leading: const Icon(Icons.assignment_add),
                title: const Text("CHOOSE SERVICES"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                  MaterialPageRoute(
                      builder:(context)=> const ServiceSelection(),
                  )
                  );
                },
              ),
            ],
          ),
        ),
      ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar()
    );
  }
}
