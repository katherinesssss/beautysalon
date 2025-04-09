import '../auth/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  final VoidCallback showRegisterPage; //VoidCallback используется, потому что виджету LoginPage нужно предоставить способ
  // уведомить свой родительский виджет (в данном случае, _AuthPageState) о том, что
  // пользователь хочет перейти на страницу регистрации.
  const LoginPage({Key? key,required this.showRegisterPage}) : super (key: key); //const позволяет использовать один и тот же экземпляр виджета, если его свойства не меняются
  @override
  State<LoginPage> createState()=>  _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Container(decoration: BoxDecoration(gradient: LinearGradient(
          colors: [Color.fromARGB(255, 95, 182, 232), Color.fromARGB(255, 102, 71, 213)],
          stops: [0.2, 0.8]),
      ),
          child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person,
                          size: 100,),
                        SizedBox(height: 15,),
                        Text('Hello again!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          'Welcome back, you\'ve been missed!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 40,),
                        //email
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child:Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Email',
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        //password
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child:Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        //sign in button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: GestureDetector(
                            onTap: signIn,
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(color: Color.fromARGB(255, 136, 89, 218),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Color.fromARGB(255, 61, 13, 95)),),

                              child: Text(
                                'Sign In',
                                style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 25,),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Not a member?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),),
                              GestureDetector(
                                onTap: widget.showRegisterPage,
                                child: Text(' Register now!',style: TextStyle(color: Color.fromARGB(255, 10, 58, 98),
                                    fontWeight: FontWeight.bold)),
                              ),
                            ]
                        ),
                      ]),
                ),
              )
          )
      ),
    );
  }
}