import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
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
            SizedBox(height: 10,),
            Text(
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Delius-Regular',
              ),
              "WELCOME BACK\n"
                  "  WE MISS YOU!",
            ),
            SizedBox(height: 120,),
            //email
            Container(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
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
              padding: EdgeInsets.symmetric(horizontal: 60),
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
            SizedBox(height: 40,),
            //button sign in
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
                      'Sign in'
                  ),
                ),
              ),
            ),
            SizedBox(height: 40,),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, '/signup');
                },
                child: RichText( //используем для разных стилей текста в одном предложении
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Not a member?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Delius-Regular',
                          ),
                        ),
                        TextSpan(
                          text: ' Register now!',
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
