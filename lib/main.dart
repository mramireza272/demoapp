import 'package:flutter/material.dart';

import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:tienda_flutter/routes/routes.dart';

void main() => runApp(Phoenix( child: new MyApp()));

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inicio de Sesión',     
      initialRoute: '/',
      routes: getApplicationRoutes()
    );
  }
}