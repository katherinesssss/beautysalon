
import 'package:beautysalon/pages/user_main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState(); //создаем экземпляр класса
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(decoration: BoxDecoration(gradient: LinearGradient(
          colors: [Color.fromARGB(255, 95, 182, 232), Color.fromARGB(255, 102, 71, 213)],
          stops: [0.2, 0.8]),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('signed in as:'+user.email!),
              SizedBox(height: 20,),
                MaterialButton(
                  onPressed: (){
                  FirebaseAuth.instance.signOut();
                },
                  highlightColor: Colors.purpleAccent,
                  color: Colors.deepPurple,
                  child: Text('sign out'),
            ),
              SizedBox(height: 50,),
              MaterialButton(onPressed: (){
                //тут написать логику перехода на страницу аккаунта
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserMainPage()));
              }, highlightColor: Colors.purpleAccent,
                color: Colors.deepPurple,
                child: Text("go to my account")
              ),
        ],
          ),
        ),
      ),
    ),
    );
  }
}