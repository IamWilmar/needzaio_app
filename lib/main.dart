import 'package:flutter/material.dart';
import 'package:needzaio_app/pages/home_page.dart';
import 'package:needzaio_app/pages/login_page.dart';
import 'package:needzaio_app/pages/splash_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Needzaio test App',
      initialRoute: 'splash',
      routes: {
        'splash'  : (_) => SplashPage(),
        'login'   : (_) => LoginPage(),
        'homePage'    : (_) => HomePage() 
      },
    );
  }
}