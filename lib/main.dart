import 'package:flutter/material.dart';
import 'appHub.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool info = prefs.getBool('logged');


  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){runApp(AppHub(log:info));});
}


