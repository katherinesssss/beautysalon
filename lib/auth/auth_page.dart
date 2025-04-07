import 'package:beautysalon/pages/login_page.dart';
import 'package:flutter/material.dart';
import '../pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //initially, show the loginpage
  bool showLoginPage = true;
  void toggleScreen(){ //переключение между страницей авторизации и регистрации
    setState(() {
      showLoginPage= !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(showRegisterPage: toggleScreen);
    } else{
      return RegisterPage(showLoginPage: toggleScreen);
    }
  }
}
