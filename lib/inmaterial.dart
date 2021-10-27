// ignore_for_file: file_names, unused_local_variable, unnecessary_new, curly_braces_in_flow_control_structures

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class inmaterial extends StatelessWidget {
  const inmaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('inmaterial'),
    );
  }
}

class Spacecraft {
  late final String idlugaresI;
  late final String Nombre,
      Categoria,
      Subcategoria,
      Ubicacion,
      Latitud,
      Longitud,
      Uso,
      Imagen,
      Sintesis,
      Extenso,
      Recorrido,
      urlExtenso;

  Spacecraft({
    required this.idlugaresI,
    required this.Nombre,
    required this.Categoria,
    required this.Subcategoria,
    required this.Ubicacion,
    required this.Latitud,
    required this.Longitud,
    required this.Uso,
    required this.Imagen,
    required this.Sintesis,
    required this.Extenso,
    required this.Recorrido,
    required this.urlExtenso,
  });

  factory Spacecraft.fromJson(Map<String, dynamic> jsonData) {
    return Spacecraft(
        idlugaresI: jsonData['idlugaresI'],
        Nombre: jsonData['Nombre'],
        Categoria: jsonData['Categoria'],
        Subcategoria: jsonData['Subcategoria'],
        Ubicacion: jsonData['Ubicacion'],
        Latitud: jsonData['Latitud'],
        Longitud: jsonData['Longitud'],
        Uso: jsonData['Uso'],
        Imagen: "https://centrodeinformacion.host/" + jsonData['Imagen'],
        Sintesis: jsonData['Sintesis'],
        Extenso: jsonData['Extenso'],
        Recorrido: jsonData['Recorrido'],
        urlExtenso: jsonData['urlExtenso']);
  }
}

class CustomListView extends StatelessWidget {
  final List<Spacecraft> spacecrafts;

  CustomListView(this.spacecrafts);

  Widget build(context) {
    return ListView.builder(
      itemCount: spacecrafts.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(spacecrafts[currentIndex], context);
      },
    );
  }

  Widget createViewItem(Spacecraft spacecraft, BuildContext context) {
    return new ListTile(
        title: new Card(
          elevation: 5.0,
          child: new Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  child: Image.network(spacecraft.Imagen),
                  padding: EdgeInsets.only(bottom: 8.0),
                ),
                Row(children: <Widget>[
                  Flexible(
                    child: Padding(
                        child: Text(
                          spacecraft.Nombre,
                          style: new TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                        padding: EdgeInsets.all(1.0)),
                  ),
                  Text(" | "),
                  Padding(
                      child: Text(
                        spacecraft.Ubicacion,
                        style: new TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.all(1.0)),
                ]),
              ],
            ),
          ),
        ),
        onTap: () {
          //We start by creating a Page Route.
          //A MaterialPageRoute is a modal route that replaces the entire
          //screen with a platform-adaptive transition.
          var route = new MaterialPageRoute(
            builder: (BuildContext context) =>
                new SecondScreen(value: spacecraft),
          );
          //A Navigator is a widget that manages a set of child widgets with
          //stack discipline.It allows us navigate pages.
          Navigator.of(context).push(route);
        });
  }
}

//Future is n object representing a delayed computation.
Future<List<Spacecraft>> downloadJSON() async {
  const jsonEndpoint = "https://centrodeinformacion.host/php/inmateriales.php";

  final response = await get(Uri.parse(jsonEndpoint));

  if (response.statusCode == 200) {
    List spacecrafts = json.decode(response.body);
    return spacecrafts
        .map((spacecraft) => new Spacecraft.fromJson(spacecraft))
        .toList();
  } else
    throw Exception('Revise su Conexiòn');
}

class SecondScreen extends StatefulWidget {
  final Spacecraft value;

  const SecondScreen({Key? key, required this.value}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inmateriales"),
        backgroundColor: const Color(0xff00C853),
      ),
      body: new Container(
        child: new SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                //`widget` is the current configuration. A State object's configuration
                //is the corresponding StatefulWidget instance.
                child: Image.network(widget.value.Imagen),
                padding: const EdgeInsets.all(12.0),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  child: new Text(
                    'Nombre : ${widget.value.Nombre}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                  ),
                  padding: const EdgeInsets.all(20.0),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  child: new Text(
                    'Ubicacion : ${widget.value.Ubicacion}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  padding: const EdgeInsets.all(20.0),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  child: new Text(
                    'Subcategoria : ${widget.value.Subcategoria}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  padding: const EdgeInsets.all(20.0),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  child: new Text(
                    'Uso : ${widget.value.Uso}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  padding: const EdgeInsets.all(20.0),
                ),
              ),
              Padding(
                child: new Text(
                  'Sintesis : ${widget.value.Sintesis}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
                padding: const EdgeInsets.all(20.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Inmateriales extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: new Scaffold(
        body: new Center(
          //FutureBuilder is a widget that builds itself based on the latest snapshot
          // of interaction with a Future.
          child: new FutureBuilder<List<Spacecraft>>(
            future: downloadJSON(),
            //we pass a BuildContext and an AsyncSnapshot object which is an
            //Immutable representation of the most recent interaction with
            //an asynchronous computation.
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Spacecraft>? spacecrafts = snapshot.data;
                return new CustomListView(spacecrafts!);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              //return  a circular progress indicator.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(Inmateriales());
}
//end