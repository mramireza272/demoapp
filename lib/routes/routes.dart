import 'package:flutter/material.dart';

import 'package:tienda_flutter/pages/login.dart';
import 'package:tienda_flutter/pages/home.dart';
import 'package:tienda_flutter/pages/users/index.dart';
import 'package:tienda_flutter/pages/users/show.dart';
import 'package:tienda_flutter/pages/users/create.dart';
import 'package:tienda_flutter/pages/users/edit.dart';

Map<String, WidgetBuilder> getApplicationRoutes(){
  
  return <String, WidgetBuilder>{
      '/'                      : (BuildContext context) => Login(),
      '/home'                  : (BuildContext context) => Home(username: username),
      '/pages/users/index'     : (BuildContext context) => Index(),
      '/pages/users/show'      : (BuildContext context) => Show(),
      '/pages/users/create'    : (BuildContext context) => Create(),
      '/pages/users/edit'      : (BuildContext context) => Edit()
  };
  
}