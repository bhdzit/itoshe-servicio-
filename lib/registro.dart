import 'package:flutter/material.dart';
import 'package:flutter_login/home.dart';
import 'login.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(registro());

class registro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Registrarse';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
          backgroundColor: const Color(0xff00C853),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Crea un Widget Form
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Crea una clase State correspondiente. Esta clase contendrá los datos relacionados con
// el formulario.
class MyCustomFormState extends State<MyCustomForm> {
  bool visible = false;

  // Getting value from TextField widget.
  final nameController = TextEditingController();
  final apellidoPcontroller = TextEditingController();
  final apellidoMcontroller = TextEditingController();
  final nombreUcontroller = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future userRegistration() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String nombreB = nameController.text;
    String apellidoPaternoB = apellidoPcontroller.text;
    String apellidoMaternoB = apellidoMcontroller.text;
    String nombreUsuarioB = nombreUcontroller.text;
    String emailB = emailController.text;
    String passwordUB = passwordController.text;
    // SERVER API URL
    var url = 'https://centrodeinformacion.host/php/agregarI.php';

    // Store all data with Param Name.
    var data = {
      "nombre": nombreB,
      "apellidoPaterno": apellidoPaternoB,
      "apellidoMaterno": apellidoMaternoB,
      "nombreUsuario": nombreUsuarioB,
      "email": emailB,
      "passwordU": passwordUB,
    };

    // Starting Web API Call.
    var response = await http.post(Uri.parse(url), body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }

    // Showing Alert Dialog with Response JSON Message.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => registro()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  bool isHiddenPassword = true;
  // Crea una clave global que identificará de manera única el widget Form
  // y nos permita validar el formulario
  //
  // Nota: Esto es un GlobalKey<FormState>, no un GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _formKey que creamos anteriormente
    return new ListTile(
      title: new Card(
        elevation: 7.0,
        child: Container(
          padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.all(20.0),
          decoration:
              BoxDecoration(border: Border.all(color: Color(0xff00C853))),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  child: new Text('Nombre'),
                  padding: const EdgeInsets.all(1.0),
                ),
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'No Puede Dejar Campos Vacios';
                    }
                  },
                  //decoration: InputDecoration(hintText: 'Nombre'),
                ),
                Padding(
                  child: new Text('Apellido Paterno'),
                  padding: const EdgeInsets.all(1.0),
                ),
                TextFormField(
                  controller: apellidoPcontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'No Puede Dejar Campos Vacios';
                    }
                  },
                ),
                Padding(
                  child: new Text('Apellido Materno'),
                  padding: const EdgeInsets.all(1.0),
                ),
                TextFormField(
                  controller: apellidoMcontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'No Puede Dejar Campos Vacios';
                    }
                  },
                ),
                Padding(
                  child: new Text('Usuario'),
                  padding: const EdgeInsets.all(1.0),
                ),
                TextFormField(
                  controller: nombreUcontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'No Puede Dejar Campos Vacios';
                    }
                  },
                ),
                Padding(
                  child: new Text('Correo'),
                  padding: const EdgeInsets.all(1.0),
                ),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'No Puede Dejar Campos Vacios';
                    }
                  },
                ),
                Padding(
                  child: new Text('Contraseña'),
                  padding: const EdgeInsets.all(1.0),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'No Puede Dejar Campos Vacios';
                    }
                  },
                  controller: passwordController,
                  obscureText: isHiddenPassword,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                        onTap: _togglePassView, child: Icon(Icons.visibility)),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      color: Color(0xff00C853),
                      onPressed: () {
                        // devolverá true si el formulario es válido, o falso si
                        // el formulario no es válido.
                        if (_formKey.currentState!.validate()) {
                          // Si el formulario es válido, queremos mostrar un Snackbar
                          userRegistration();
                        }
                      },
                      child: Text('Registrarse '),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      color: Color(0xff00C853),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginApp()),
                        );
                      },
                      child: Text('Volver '),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePassView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
