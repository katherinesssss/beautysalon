import 'package:beautysalon/my_drawer.dart';
import 'package:beautysalon/pages/main_page.dart';
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
        home: Scaffold(
          body: MainPage(),
        ),
      ),
    );
  }
}