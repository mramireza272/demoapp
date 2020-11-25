import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Edit extends StatefulWidget {
  final List list;
  final int index;

  Edit({this.list, this.index});

  @override
  _EditState createState() => new _EditState();
}

class _EditState extends State<Edit> {

  TextEditingController controllerUsername;
  TextEditingController controllerPassword;
  TextEditingController controllerNivel;
  


  void edit(BuildContext context) {

    var url="https://apifluttertest.000webhostapp.com/editdata.php";
    
    http.post(url,body: {
      "id": widget.list[widget.index]['id'],
      "username": controllerUsername.text,
      "password": controllerPassword.text,
      "nivel": controllerNivel.text
    });

    Navigator.pushNamed(context, '/home');
  }


  @override
    void initState() {
      controllerUsername= new TextEditingController(text: widget.list[widget.index]['username'] );
      controllerPassword= new TextEditingController(text: widget.list[widget.index]['password'] );
      controllerNivel= new TextEditingController(text: widget.list[widget.index]['nivel'] );
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Editar Usuario"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[900]
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: 30.0),
          FloatingActionButton(
            heroTag: 'btn_update',
            child: new Icon(Icons.update),
            onPressed: () {
              edit(context);
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
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              new Column(
                children: <Widget>[
                new ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerUsername,
                          // ignore: missing_return
                          validator: (value) {
                            if (value.isEmpty) return "Ingresa un nombre de usurio";
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
                            if (value.isEmpty) return "Ingresa una Contraseña";
                          },
                      decoration: new InputDecoration(
                        hintText: "Contraseña", labelText: "Contraseña",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.settings_input_component, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerNivel,
                          // ignore: missing_return
                          validator: (value) {
                            if (value.isEmpty) return "Ingresa un Nivel";
                          },
                      decoration: new InputDecoration(
                        hintText: "Nivel", labelText: "Nivel",
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1.0,
                  ),
                  SizedBox(height:30.0),
                  Image.asset('assets/images/home2.png', height: 150.0, width: 200.0),              
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                  )
                  // new RaisedButton(
                  //   child: new Text("Guardar"),
                  //   color: Colors.blueAccent,
                  //   onPressed: () {
                  //     editData();
                  //     Navigator.of(context).push(
                  //       new MaterialPageRoute(
                  //         builder: (BuildContext context)=>new Home()
                  //       )
                  //     );
                  //   },
                  // )
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}