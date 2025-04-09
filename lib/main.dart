import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'consumers.dart';
import 'navigation.dart';
import 'auth/main_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //подготавливаем флатер к работе и
  // вызываем метод, чтобы фреймворк был правильно инициирован внутри нативной платформы
  await Firebase.initializeApp(options: const FirebaseOptions(
      apiKey: "AIzaSyAvCu_yNOA8IGKQDm5y2EjeU4CG4N89_14",
      authDomain: "beautysalon-33d73.firebaseapp.com",
      projectId: "beautysalon-33d73",
      storageBucket: "beautysalon-33d73.firebasestorage.app",
      messagingSenderId: "1092105516323",
      appId: "1:1092105516323:web:b899c88ca1698735094896"));

  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'beautysalon',
      home: MainPage(),

    );

  }
}
