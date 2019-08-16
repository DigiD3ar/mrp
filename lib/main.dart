import 'package:flutter/material.dart';
import 'appHub.dart';
import 'package:flutter/services.dart';


void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Color.fromARGB(255,220,86,73),
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){runApp(AppHub());});
}


