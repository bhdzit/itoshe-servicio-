// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'acerca.dart';
import 'agendar.dart';
import 'configuracion.dart';
import 'contacto.dart';
import 'cultural.dart';
import 'Inicio.dart';
import 'inmaterial.dart';
import 'natural.dart';
import 'ruta.dart';

import 'login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectDrawerItem = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return inicio();
      case 1:
        return Culturales();
      case 2:
        return Naturales();
      case 3:
        return Inmateriales();
      case 4:
        return ruta();
      case 5:
        return agendar();
      case 6:
        return acerca();
      case 7:
        return configuracion();
      case 8:
        return contacto();
        break;
      default:
    }
  }

  _onSelectItem(int pos) {
    Navigator.of(context).pop();
    setState(() {
      _selectDrawerItem = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xff00C853),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            // ignore: prefer_const_constructors
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff00C853),
              ),
              // ignore: prefer_const_constructors
              accountName: Text('Centro De Inmformación'),
              accountEmail: Text('Bienvenido'),
              currentAccountPicture: CircleAvatar(
                child: new Image.asset(
                  'assets/images/Logo.png',
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Inicio',
                style: TextStyle(color: Colors.black.withOpacity(0.5)),
              ),
            ),
            ListTile(
              title: Text('Inicio'),
              leading: Icon(Icons.home),
              selected: (0 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(0);
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'Lugares',
                style: TextStyle(color: Colors.black.withOpacity(0.5)),
              ),
            ),
            ListTile(
              title: Text('Lugares Culturales'),
              leading: Icon(Icons.photo_size_select_actual_sharp),
              selected: (1 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(1);
              },
            ),
            ListTile(
              title: Text('Lugares Naturales'),
              leading: Icon(Icons.photo_size_select_actual_sharp),
              selected: (2 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(2);
              },
            ),
            ListTile(
              title: Text('Lugares Inmateriales'),
              leading: Icon(Icons.photo_size_select_actual_sharp),
              selected: (3 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(3);
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'Ruta',
                style: TextStyle(color: Colors.black.withOpacity(0.5)),
              ),
            ),
            ListTile(
              title: Text('Ruta'),
              leading: Icon(Icons.map_outlined),
              selected: (4 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(4);
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'Visitas Agendas',
                style: TextStyle(color: Colors.black.withOpacity(0.5)),
              ),
            ),
            ListTile(
              title: Text('Visitas Agendadas'),
              leading: Icon(Icons.calendar_today),
              selected: (5 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(5);
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'Mas',
                style: TextStyle(color: Colors.black.withOpacity(0.5)),
              ),
            ),
            ListTile(
              title: Text('Acerca de'),
              leading: Icon(Icons.info),
              selected: (6 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(6);
              },
            ),
            ListTile(
              title: Text('Configuración'),
              leading: Icon(Icons.settings),
              selected: (7 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(7);
              },
            ),
            ListTile(
              title: Text('Contacto'),
              leading: Icon(Icons.connect_without_contact_sharp),
              selected: (8 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(8);
              },
            ),
            ListTile(
              title: Text('Salir'),
              leading: Icon(Icons.exit_to_app),
              selected: (9 == _selectDrawerItem),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginApp()),
                );
              },
            ),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectDrawerItem),
    );
  }
}
