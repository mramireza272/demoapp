import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String username='';
String msg='';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

TextEditingController user = new TextEditingController();
TextEditingController pass = new TextEditingController();

Future<List> _login(BuildContext context) async {
  final response = await http.post("https://apifluttertest.000webhostapp.com/login.php", body: {
    "username": user.text,
    "password": pass.text,
  });

  var datauser = json.decode(response.body);

  if(datauser.length==0){
    if(mounted){
      setState(() {
        msg="Usuario o Contraseña Incorrectos";
      });
    }
  }else{
    if(datauser[0]['nivel']=='Administrador'){
       Navigator.pushNamed(context, '/home');
    }else if(datauser[0]['nivel']=='Visita'){
      // Navigator.pushNamed(context, '/bodegaPage');
    }else{
      if(mounted){
        setState(() {
          msg="Rol no Registrado";
        });
      }
    }

    if(mounted){
      setState(() {
        username= datauser[0]['username'];
      });
    }

  }

  return datauser;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio de Sesión"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[900]
        ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/fondo_2.jpg'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20.0),
              Center(
                child: Container(
                  child: Image.asset('assets/images/home2.png', height: 125.0, width: 190.0)
                )
              ),
              SizedBox(height: 8.0),
              Text("Usuario",style: TextStyle(fontSize: 23.0, color: Colors.blue[900])),
              SizedBox(height: 5.0),
              TextField(   
                controller: user,                
                decoration: InputDecoration(
                  hintText: 'Ingrese su Usuario'
                ),           
              ),
              SizedBox(height: 20.0),
              Text("Contraseña",style: TextStyle(fontSize: 23.0, color: Colors.blue[900])),
              SizedBox(height: 5.0),
              TextField(  
                controller: pass,  
                obscureText: true,                
                 decoration: InputDecoration(
                  hintText: 'Ingrese su Contraseña'
                ),                
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                child: Text("Iniciar Sesión"),
                onPressed: (){
                  _login(context);
                  // Navigator.pop(context); 
                },
                color: Colors.blue[900],
                textColor: Colors.white
              ),
              SizedBox(height: 20.0),
              Center(
                child: Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.red),)
              )
            ],
          ),
       ),
      )
    );
}
}