import 'package:flutter/material.dart';
import 'general.dart';


class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  GestureDetector(
        onTap: ()=>Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => General()),
        ),
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration:  BoxDecoration(
            image:  DecorationImage(
              image:  AssetImage("assets/splash.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
