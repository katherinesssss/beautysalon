
import 'package:beautysalon/pages/main_page.dart';
import 'package:beautysalon/pages/service_page.dart';
import 'package:beautysalon/pages/settings_page.dart';
import 'package:beautysalon/pages/sign_in_page.dart';
import 'package:beautysalon/pages/sign_up_page.dart';
import 'package:beautysalon/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
void main() async{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context){
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>ThemeProvider(),)
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/signin',
        routes: {
          '/signup': (context) => const SignUpPage(),
          '/home': (context) => const MainPage(),
          '/signin':(context)=>const SignInPage(),
          '/settings':(context)=>const SettingsPage(),
          '/logout':(context)=>const SignInPage(),
          '/services':(context)=>const ServicePage(),
          //'/cart':(context)=>const CartPage(),


        },
        home: Scaffold(
          body: SignInPage(),
        ),
      ),
    );
  }
}