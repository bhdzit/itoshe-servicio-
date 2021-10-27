// ignore_for_file: file_names

import 'package:flutter/material.dart';

class contacto extends StatelessWidget {
  const contacto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              // ignore: unnecessary_new
              new Padding(
                padding: EdgeInsets.only(top: 150.0),
                child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0x0f81f7f3),
                  child: Image(
                    image: AssetImage("assets/images/Logo.png"),
                  ),
                ),
              ),
              Padding(
                child: new Text(
                  'Cristy Elizabeth Aguilar Ojeda',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                padding: const EdgeInsets.all(10.0),
              ),
              Padding(
                child: new Text(
                  'correo:caguilar@itsoeh.edu.mx',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                padding: const EdgeInsets.all(10.0),
              ),
              Padding(
                child: new Text(
                  'tel:	(738) 73 54 000 ext. 240',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                padding: const EdgeInsets.all(10.0),
              ),
              Padding(
                padding: EdgeInsets.only(top: 150.0),
                child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0x0f81f7f3),
                  child: Image(
                    image: AssetImage("assets/images/Logo.png"),
                  ),
                ),
              ),
              Padding(
                child: new Text(
                  'Rolando Porras Muñoz',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                padding: const EdgeInsets.all(10.0),
              ),
              Padding(
                child: new Text(
                  'correo:rporras@itsoeh.edu.mx',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                padding: const EdgeInsets.all(10.0),
              ),
              Padding(
                child: new Text(
                  'tel:	(738) 73 54 000 ext. 240',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                padding: const EdgeInsets.all(10.0),
              ),
              Spacer(),
              Padding(
                child: new Text(
                  'Copyright ©2021 Todos los derechos reservados  03-2021-050712355400-01',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                padding: const EdgeInsets.all(20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
