// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class acerca extends StatelessWidget {
  const acerca({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (ListView(
      children: <Widget>[
        Container(
          height: 300,
          child: Text(
            "Acerca de",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontFamily: "Raleway",
                fontWeight: FontWeight.w700),
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/aboutx.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 500,
          child: new SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    child: new Text(
                      'CENTRO DE INFORMACION',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    padding: const EdgeInsets.all(10.0),
                  ),
                ),
                Padding(
                  child: new Text(
                    ' El centro de información del patrimonio natural y cultural tiene como función principal ser un centro de monitoreo de las condiciones de dicho patrimonio, a partir de la generación de sinergias colectivas en las que se involucre a los actores sociales en el reconocimiento, cuidado, preservación, disfrute etcétera de los espacios y/o prácticas que sean manifestaciones patrimoniales.',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    textAlign: TextAlign.justify,
                  ),
                  padding: const EdgeInsets.all(10.0),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    child: new Text(
                      'PRESENTACION',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    padding: const EdgeInsets.all(10.0),
                  ),
                ),
                Padding(
                  child: new Text(
                    ' El propósito del Centro de información del Patrimonio Cultural Y Natural Del Valle Del Mezquital, Hidalgo surge debido a la preocupación por el desconocimiento de algunos lugares culturales y naturales en el Valle del Mezquital' +
                        'por parte de los mismos habitantes de esta zona; lo que eventualmente puede provocar la poca valoración y conservación de estos, sobre todo, una merma o tergiversación en las prácticas sociales y culturales que se realizan en torno a éstos. Con base en' +
                        'esto, el objetivo del Observatorio es identificar su categoría y subcategoría, revalorarlos, reutilizarlos, se difundan y divulguen por medio de las Tecnologías de la Información para una mayor rapidez y con un mayor alcance y con' +
                        'ello, promoverlos y proveerlos de un adecuado uso.',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    textAlign: TextAlign.justify,
                  ),
                  padding: const EdgeInsets.all(10.0),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
