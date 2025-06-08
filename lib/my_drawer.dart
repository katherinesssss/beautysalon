import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 80),
            child: Icon(Icons.lock_open,
              size: 60,
            ),
          ),

          Padding(padding: EdgeInsets.all(8),
            child: Divider(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
              padding: EdgeInsets.all(30),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "HOME",
                        style: TextStyle(
                          fontFamily: 'Delius-Regular',
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      IconButton(onPressed: (){
                        Navigator.of(context,rootNavigator: true).pushNamed( '/home');
                      }, icon: Icon(Icons.home))
                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("SETTINGS",
                        style: TextStyle(
                            fontFamily: 'Delius-Regular',
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      IconButton(onPressed: (){
                        Navigator.of(context,rootNavigator: true).pushNamed( '/settings');
                      }, icon: Icon(Icons.settings))
                      ]
                    ),
                  SizedBox(height: 250,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("LOG OUT",
                          style: TextStyle(
                              fontFamily: 'Delius-Regular',
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        IconButton(onPressed: (){
                          Navigator.of(context,rootNavigator: true).pushNamed( '/logout');
                        }, icon: Icon(Icons.logout))
                      ]
                  ),
                ],
              ),



            ),
          ),
          ],
      ),
    );
  }
}
