// ignore_for_file: file_names, unused_local_variable, unnecessary_new, curly_braces_in_flow_control_structures

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class cultural extends StatelessWidget {
  const cultural({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('cultural'),
    );
  }
}

class Spacecraft {
  late final String idlugares;
  late final String Nombre,
      Categoria,
      Subcategoria,
      Ubicacion,
      Latitud,
      Longitud,
      Clima,
      Temperatura,
      PrecipitacionPluvial,
      Uso,
      Imagen,
      Sintesis,
      Extenso,
      Recorrido,
      urlExtenso;

  Spacecraft({
    required this.idlugares,
    required this.Nombre,
    required this.Categoria,
    required this.Subcategoria,
    required this.Ubicacion,
    required this.Latitud,
    required this.Longitud,
    required this.Clima,
    required this.Temperatura,
    required this.PrecipitacionPluvial,
    required this.Uso,
    required this.Imagen,
    required this.Sintesis,
    required this.Extenso,
    required this.Recorrido,
    required this.urlExtenso,
  });

  factory Spacecraft.fromJson(Map<String, dynamic> jsonData) {
    return Spacecraft(
        idlugares: jsonData['idlugares'],
        Nombre: jsonData['Nombre'],
        Categoria: jsonData['Categoria'],
        Subcategoria: jsonData['Subcategoria'],
        Ubicacion: jsonData['Ubicacion'],
        Latitud: jsonData['Latitud'],
        Longitud: jsonData['Longitud'],
        Clima: jsonData['Clima'],
        Temperatura: jsonData['Temperatura'],
        PrecipitacionPluvial: jsonData['PrecipitacionPluvial'],
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
  try {
    const jsonEndpoint = "https://centrodeinformacion.host/php/index.php";

    final response = await get(Uri.parse(jsonEndpoint));
    List spacecrafts = json.decode(response.body);
    return spacecrafts
        .map((spacecraft) => new Spacecraft.fromJson(spacecraft))
        .toList();
  } catch (e) {
    throw Exception('error al obtener los datos.');
  }
}

class SecondScreen extends StatefulWidget {
  final Spacecraft value;

  const SecondScreen({Key? key, required this.value}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late GoogleMapController mapController;
  final Map<String, Marker> _markers = {};
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      final marker = Marker(
        markerId: MarkerId('${widget.value.Nombre}'),
        position: LatLng(double.parse('${widget.value.Latitud}'),
            double.parse('${widget.value.Longitud}')),
        infoWindow: InfoWindow(
          title: 'Nombre:${widget.value.Nombre}',
          snippet: 'Ubicacion : ${widget.value.Ubicacion}',
        ),
      );
      _markers['${widget.value.Nombre}'] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Culturales"),
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
                    textDirection: TextDirection.ltr,
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
                    'Clima : ${widget.value.Clima}',
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
                    'Temperatura : ${widget.value.Temperatura}',
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
                    'Precipitacion Pluvial : ${widget.value.PrecipitacionPluvial}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  padding: const EdgeInsets.all(10.0),
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
              ),
              Container(
                height: 500,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(double.parse('${widget.value.Latitud}'),
                        double.parse('${widget.value.Longitud}')),
                    zoom: 11.0,
                  ),
                  markers: _markers.values.toSet(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Culturales extends StatelessWidget {
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
  runApp(Culturales());
}
//end