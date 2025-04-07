import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  Future signUp() async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }
  @override
  Widget build(BuildContext context) {
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
                        Text('Hello there',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          'Register below!',
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
                            onTap: signUp,
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(color: Color.fromARGB(255, 136, 89, 218),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Color.fromARGB(255, 61, 13, 95)),),

                              child: Text(
                                'Sign Up',
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
                              Text('Are u a member?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),),
                              GestureDetector(
                                onTap: widget.showLoginPage,
                                child: Text(' Login now!',style: TextStyle(color: Color.fromARGB(255, 10, 58, 98),
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
