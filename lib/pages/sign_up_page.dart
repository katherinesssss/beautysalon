import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.cyan, Colors.blueAccent.shade100],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 40,),
            Image.asset(
              'lib/assets/lotos.png',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 100,),
            //email
            Container(
              padding: EdgeInsets.symmetric(horizontal: 90, vertical: 20),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Email",
                  suffixIcon: Icon(Icons.account_circle_outlined, color: Colors.black12,),
                  fillColor: Colors.grey,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white10, width: 2),
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
            ),
            //password
            Container(
              padding: EdgeInsets.symmetric(horizontal: 90,vertical: 20),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Password',
                  suffixIcon: Icon(Icons.key, color: Colors.black12,),
                  fillColor: Colors.grey,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white10, width: 2),
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
            ),
            //confirm password
            Container(
              padding: EdgeInsets.symmetric(horizontal: 90, vertical: 20),
              child: TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Confirm password',
                  suffixIcon: Icon(Icons.key, color: Colors.black12,),
                  fillColor: Colors.grey,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white10, width: 2),
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
            ),
            SizedBox(height: 40,),
            //button sign up
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/home');
                },
                child: Container(
                  width: 130,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.indigo.shade900,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontFamily: 'Delius-Regular',
                      ),
                      'Sign up'
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/signin');
              },
              child: RichText( //используем для разных стилей текста в одном предложении
                text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Are you a member?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Delius-Regular',
                        ),
                      ),
                      TextSpan(
                        text: ' Sign in there!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Delius-Regular',
                        ),
                      )
                    ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
