import 'package:flutter/material.dart';

import 'package:advanced_error_handling/app/screen/home/home_screen.dart';
import 'package:advanced_error_handling/app/screen/sign_up/sign_up_screen.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SignUpScreen.routeName: (_) => const SignUpScreen(),
      },
    );
  }
}
