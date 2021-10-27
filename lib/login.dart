// ignore_for_file: unnecessary_new

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login/home.dart';
import 'package:flutter_login/main.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() => runApp(LoginApp());

String email = '';

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Centro de informacion',
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/LoginPage': (BuildContext context) => const LoginPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();
  String mensaje = '';

  Future<List> login() async {
    var url = "https://centrodeinformacion.host/php/app_login.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": controllerUser.text,
      "passwordU": controllerPass.text,
    });
    var datauser = jsonDecode(response.body);

    if (datauser.length == 0) {
      setState(() {
        mensaje = "usuario o contraseña incorrectas";
      });
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Centro de Información"),
        centerTitle: false,
        backgroundColor: const Color(0xff00C853),
      ),
      body: Center(
        child: Form(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/Dianav2.png"),
              fit: BoxFit.cover,
            )),
            child: Column(
              children: <Widget>[
                // ignore: unnecessary_new
                new Container(
                  padding: const EdgeInsets.only(top: 60.0),
                  // ignore: prefer_const_constructors

                  width: 290.0,
                  height: 290.0,
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(shape: BoxShape.circle),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  // ignore: prefer_const_constructors
                  padding: EdgeInsets.only(top: 93),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        // ignore: prefer_const_constructors
                        padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            // ignore: prefer_const_literals_to_create_immutables
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                              )
                            ]),
                        child: TextFormField(
                          controller: controllerUser,
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                              // ignore: prefer_const_constructors
                              icon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              hintText: 'email'),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 50,
                        margin: const EdgeInsets.only(top: 32),
                        padding: const EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: TextField(
                          controller: controllerPass,
                          obscureText: true,
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.vpn_key,
                                color: Colors.black,
                              ),
                              hintText: 'Password'),
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      Align(
                        alignment: Alignment.centerRight,
                        child: const Padding(
                          padding: EdgeInsets.only(
                            top: 6,
                            right: 32,
                          ),
                        ),
                      ),
                      Spacer(),
                      // ignore: deprecated_member_use
                      new RaisedButton(
                        child: const Text("Ingresar"),
                        color: Color(0xff00C853),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                          );
                        },
                      ),
                      Text(
                        mensaje,
                        style: TextStyle(fontSize: 25.0, color: Colors.red),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
