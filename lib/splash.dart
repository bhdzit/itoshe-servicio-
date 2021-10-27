// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'login.dart';
import 'main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 10000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginApp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/descarga.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              // ignore: unnecessary_new
              new Container(
                padding: EdgeInsets.only(top: 150.0),
                child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0x0f81f7f3),
                  child: Image(
                    image: AssetImage("assets/images/Logo.png"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
