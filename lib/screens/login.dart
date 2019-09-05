import 'package:flutter/material.dart';
import 'general.dart';
import '../dal.dart';
import 'dart:convert';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final Dal dal = new Dal();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        constraints: BoxConstraints.expand(),
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/loginbg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child:
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  height: 145,
                  width: 190.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/logomr.png"),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 15.0, bottom: 20.0),
                    child: Text(
                      "Please enter your \n code",
                      textScaleFactor: 1.1,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,fontFamily: 'SFProText'),
                      textAlign: TextAlign.center,
                    )),
                Container(
                  child: TextField(
                    controller: this.pass,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        fontSize: 25,
                        letterSpacing: 3.5,
                        fontWeight: FontWeight.bold,fontFamily: 'SFProText'),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                      border: new OutlineInputBorder(borderRadius: const BorderRadius.all(const Radius.circular(35.0),), borderSide: BorderSide(width: 0.0, style: BorderStyle.none)),),
                    onEditingComplete:()=>
                    {
                      dal.login(pass.text).then((x)=>Navigator.pushNamed(context, General.routeName,arguments:ScreenArguments(json.decode(x.body)['data'])))

                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
