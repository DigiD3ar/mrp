import 'package:flutter/material.dart';
import 'appHub.dart';
import 'package:flutter/services.dart';


void main(){
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){runApp(AppHub());});
}


