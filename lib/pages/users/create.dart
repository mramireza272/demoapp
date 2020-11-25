import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Create extends StatefulWidget {
  @override
  _CreateState createState() => new _CreateState();
}

class _CreateState extends State<Create> {
  TextEditingController controllerUsername = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  //TextEditingController controllerNivel = new TextEditingController();

  var _formKey = GlobalKey<FormState>();

  void create(BuildContext context) {
    var url = "https://apifluttertest.000webhostapp.com/adddata.php";

    http.post(url, body: {
      "username": controllerUsername.text,
      "password": controllerPassword.text,
      "nivel": _mySelection.toString(), //aqui traemos el DropdownMenuItem lo llamamos _mySelection este es como el controller
      //"nivel": controllerNivel.text
    });

    Navigator.pushNamed(context, '/home');
  }
  
  String _mySelection;
  List<Map> _myJson = [{"id":0,"name":"Visita"},{"id":1,"name":"Administrador"}];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Agregar Usuario"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[900]
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: 30.0),
          FloatingActionButton(
            heroTag: 'btn_add',
            child: new Icon(Icons.save),
            onPressed: (){
              if (_formKey.currentState.validate()) {
                create(context);
              }
            },
            backgroundColor: Colors.blue[900]
          ),
          SizedBox(width: 10.0),
          FloatingActionButton(
            heroTag: 'btn_back',
            child: new Icon(Icons.arrow_forward_outlined),
            onPressed: (){
              Navigator.pop(context);
            },
            backgroundColor: Colors.blue[900]
          ),
          SizedBox(width: 5.0)
        ],
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/fondo_2.jpg'), fit: BoxFit.cover),
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new ListTile(
                      leading: const Icon(Icons.person, color: Colors.black),
                      title: new TextFormField(
                        controller: controllerUsername,
                            // ignore: missing_return
                            validator: (value) {
                              if (value.isEmpty) return "Ingresa un nombre de usuario";
                            },
                        decoration: new InputDecoration(
                          hintText: "Usurio", labelText: "Usuario",
                        ),
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(Icons.location_on, color: Colors.black),
                      title: new TextFormField(
                        controller: controllerPassword,
                            // ignore: missing_return
                            validator: (value) {
                              if (value.isEmpty) return "Ingresa una contraseña";
                            },
                        decoration: new InputDecoration(
                          hintText: "Contraseña", labelText: "Contraseña",
                        ),
                      ),
                    ),
                  Row(
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.only(left: 20.0),
                          child: Icon(Icons.list),
                      ),
                      VerticalDivider(width: 40.0,),
                      new Container(                   
                        //margin: EdgeInsets.only(right: 80.0),
                        height: 50.0,
                        width: 100.0,
                        child: new DropdownButton<String>(
                              isDense: true,
                              isExpanded: true,
                              hint: new Text("Rol"),
                              iconSize: 40.0,
                              elevation: 10,
                              value: _mySelection,
                              onChanged: (String newValue) {
                                setState(() {
                                  _mySelection = newValue;
                                });
                                print (_mySelection);
                              },
                              items: _myJson.map((Map map) {
                                return new DropdownMenuItem<String>(
                                  //value: map["id"].toString(),
                                  value: map["name"].toString(),
                                  child: new Text(
                                    map["name"],
                                  ),
                                );
                              }).toList(),
                          ),
                      ),
                    ],
                  ),
                  SizedBox(height:30.0),
                  Image.asset('assets/images/home2.png', height: 150.0, width: 200.0),
                    new Padding(
                    padding: const EdgeInsets.all(30.0),
                  )              
                    // new RaisedButton(
                    //   child: new Text("Agregar"),
                    //   color: Colors.blueAccent,
                    //   shape: new RoundedRectangleBorder(
                    //       borderRadius: new BorderRadius.circular(30.0)),
                    //   onPressed: () {
                    //     if (_formKey.currentState.validate()) {
                    //       addData(context);
                    //     }
                    //   },
                    // ),
                    // new RaisedButton(
                    //   child: new Text("Salir"),
                    //   color: Colors.blueAccent,
                    //   shape: new RoundedRectangleBorder(
                    //       borderRadius: new BorderRadius.circular(30.0)),
                    //   onPressed: () {
                    //     Navigator.pushReplacementNamed(context, '/adminPage');
                    //   },
                    // )
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
