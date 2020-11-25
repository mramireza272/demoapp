import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tienda_flutter/pages/users/show.dart';

import 'dart:async';
import 'dart:convert';

import 'package:tienda_flutter/pages/users/create.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => new _IndexState();
}

class _IndexState extends State<Index> {
  Future<List> getData() async {
    final response = await http.get("https://apifluttertest.000webhostapp.com/getdata.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Lista de Usuarios"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[900]
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: 30.0),
          FloatingActionButton(
            heroTag: 'btn_add',
            child: new Icon(Icons.add),
            onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new Create(),
            )),
            backgroundColor: Colors.blue[900]
          ),
          SizedBox(width: 10.0),
          FloatingActionButton(
            heroTag: 'btn_back',
            child: new Icon(Icons.arrow_forward_outlined),
            onPressed: (){
              Navigator.pushNamed(context,'/home');
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
        child: new FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new ItemList(
                    list: snapshot.data,
                  )
                : new Center(
                    child: new CircularProgressIndicator(),
                  );
          },
        ),
      )
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new Show(
                            list: list,
                            index: i,
                          )),
                ),
            child: new Card(
              // elevation: 0,
              // color: Colors.transparent,
              child: new ListTile(
                title: new Text(
                  list[i]['username'],
                  style: TextStyle(fontSize: 25.0, color: Colors.grey[700]),
                ),
                leading: new Icon(
                  Icons.person_pin,
                  size: 77.0,
                  color: Colors.grey[700],
                ),
                subtitle: new Text(
                  "Rol : ${list[i]['nivel']}",
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
