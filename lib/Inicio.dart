// ignore_for_file: file_names

import 'package:flutter/material.dart';

class inicio extends StatelessWidget {
  const inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (ListView(
      children: <Widget>[
        Container(
          height: 300,
          child: Text(
            "Patrimonio Cultural",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontFamily: "Raleway",
                fontWeight: FontWeight.w700),
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/cult.png"),
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
                      '¿QUE ES EL PATRIMONIO CULTURAL?',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                  ),
                ),
                Padding(
                  child: new Text(
                    'El Patrimonio Cultural es el conjunto de bienes tangibles e intangibles, que constituyen la herencia de un grupo humano, que refuerzan emocionalmente su sentido de comunidad con una identidad propia y que son percibidos por otros como característicos.',
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
                      'ESTA INTEGRADO POR:',
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
                    ' El Patrimonio Cultural Tangible: bienes muebles y bienes inmuebles, constituido por objetos que tienen sustancia física y pueden ser conservados y restaurados por algún tipo de intervención.',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    textAlign: TextAlign.justify,
                  ),
                  padding: const EdgeInsets.all(10.0),
                ),
                Padding(
                  child: new Text(
                    '   El Patrimonio Cultural Intangible: puede ser definido como el conjunto de elementos sin sustancia física, o formas de conducta que procede de una cultura tradicional, popular o indígena; y el cual se transmite oralmente o mediante gestos y se modifica con el transcurso del tiempo a través de un proceso de recreación colectiva.',
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
        Container(
          height: 500,
          child: Text(
            'Patrimonio Natural',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontFamily: "Raleway",
                fontWeight: FontWeight.w700),
          ),
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/natu.png"),
            fit: BoxFit.cover,
          )),
          padding: const EdgeInsets.all(8),
        ),
        Container(
          child: new SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    child: new Text(
                      '¿QUE ES EL PATRIMONIO NATURAL?',
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
                    ' El Patrimonio Natural es el conjunto de bienes y riquezas naturales, o ambientales, que la sociedad ha heredado de sus antecesores.',
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
                      'ESTA INTEGRADO POR:',
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
                    ' Los monumentos naturales constituidos por formaciones físicas y biológicas o por grupos de esas formaciones que tengan un valor universal excepcional desde el punto de vista estético o científico.',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    textAlign: TextAlign.justify,
                  ),
                  padding: const EdgeInsets.all(10.0),
                ),
                Padding(
                  child: new Text(
                    '   Las formaciones geológicas y fisiográficas y las zonas estrictamente delimitadas que constituyan el hábitat de especies animal y vegetal, amenazadas o en peligro de extinción.',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    textAlign: TextAlign.justify,
                  ),
                  padding: const EdgeInsets.all(10.0),
                ),
                Padding(
                  child: new Text(
                    '  Formas de expresión (manifestaciones literarias, musicales, plásticas, escénicas, lúdicas, entre otras).',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    textAlign: TextAlign.justify,
                  ),
                  padding: const EdgeInsets.all(10.0),
                ),
                Padding(
                  child: new Text(
                    '  Los lugares naturales o las zonas naturales estrictamente delimitadas (como parques nacionales, áreas de conservación, entre otros) que tengan un valor excepcional desde el punto de vista de la ciencia, de la conservación o de la belleza natural.',
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
        Container(
          height: 310,
          child: Text(
            'Patrimonio Inmaterial',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontFamily: "Raleway",
                fontWeight: FontWeight.w700),
          ),
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("assets/images/inma.png"))),
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
                      '¿QUE ES EL PATRIMONIO INMATERIAL?',
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
                    'Se entiende por patrimonio inmaterial los usos,representaciones, expresiones, conocimientos y técnicas; junto con los instrumentos, objetos,artefactos y espacios culturales que les son inherentes; donde las comunidades,los grupos y en algunos casos los individuos reconozcan como parte integrante de su patrimonio.Este patrimonio inmaterial,que se transmite de generación en generación',
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
                      'ESTA INTEGRADO POR:',
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
                    '  El patrimonio inmaterial se manifiesta en particular en los ámbitos siguientes: tradiciones y expresiones orales, incluido el idioma como vehículo del patrimonio cultural inmaterial; artes del espectáculo; usos sociales, rituales y actos festivos',
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
