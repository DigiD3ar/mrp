import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/general.dart';


class AppHub extends StatelessWidget {

  final bool log;

  AppHub({this.log});

  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      title: 'Merida Rentals',
      theme: ThemeData(
        primaryColor:  Color.fromARGB(255,220,86,73),
        accentColor:    Color.fromARGB(255,220,86,73),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/provider':
            {
              return MaterialPageRoute(builder: (_) => General(Info:settings.arguments));
            }
          case'/':
            {
              return MaterialPageRoute(builder: (_) => Login());
            }
          default:
            return null;
        }
      },
      debugShowCheckedModeBanner: false,
      initialRoute: this.log? '/provider' : '/' ,
    );
  }
}


