import 'package:flutter/material.dart';

import 'package:flutter_phoenix/flutter_phoenix.dart';

class Home extends StatelessWidget {
 
  Home({this.username});
  final String username;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Administrador'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[900]
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: 30.0),
          Image.asset('assets/images/home2.png', height: 60.0, width: 130.0),
          SizedBox(width: 120.0),
          FloatingActionButton(
            heroTag: 'btn_back',
            child: new Icon(Icons.arrow_forward_outlined),
            onPressed: (){
              Phoenix.rebirth(context);
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
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50.0),
              Text("¡Bienvenido(a)!",style: TextStyle(fontSize: 40.0, color: Colors.blue[900])),
              SizedBox(height: 120.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/pages/users/index');
                    },
                    child: new Icon(
                      Icons.people,
                      color: Colors.blue[900],
                      size: 63.0,
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.white,
                    padding: const EdgeInsets.all(7.0),
                  )
                ]
              ),
            ]
          ) 
        )
      )
    );
  }
}