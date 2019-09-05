import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/general.dart';

class AppHub extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Merida Rentals',
      theme: ThemeData(
        primaryColor:  Color.fromARGB(255,220,86,73),
        accentColor:    Color.fromARGB(255,220,86,73),
      ),
      routes: {
        General.routeName: (context) => General(),
        '/': (context) => new Login(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
    );
  }
}


