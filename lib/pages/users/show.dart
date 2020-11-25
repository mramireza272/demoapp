import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import './edit.dart';

// ignore: must_be_immutable
class Show extends StatefulWidget {
  List list;
  int index;
  Show({this.index,this.list});
  @override
  _ShowState createState() => new _ShowState();
}

class _ShowState extends State<Show> {

void delete(BuildContext context){
  var url="https://apifluttertest.000webhostapp.com/deleteData.php";
  http.post(url, body: {
    'id': widget.list[widget.index]['id']
  });

  Navigator.pushNamed(context,'/home');
}

void confirm (BuildContext context){
  AlertDialog alertDialog = new AlertDialog(
    content: new Text("Esta seguro(a) de eliminar a '${widget.list[widget.index]['username']}'"),
    actions: <Widget>[
      new RaisedButton(
        child: new Text("Si",style: new TextStyle(color: Colors.white),),
        color: Colors.red,
        onPressed: (){
          delete(context);
          // Navigator.of(context).push(
          //   new MaterialPageRoute(
          //     builder: (BuildContext context)=> new Home(),
          //   )
          // );
        },
      ),
      new RaisedButton(
        child: new Text("No",style: new TextStyle(color: Colors.white)),
        color: Colors.green,
        onPressed: ()=> Navigator.pop(context),
      ),
    ],
  );

  showDialog(context: context, child: alertDialog);
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // title: new Text("Detalles del Usuario '${widget.list[widget.index]['username']}'"),
        title: new Text("Detalles del Usuario"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[900]        
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: 30.0),
          FloatingActionButton(
            heroTag: 'btn_edit',
            child: new Icon(Icons.edit),
            onPressed: ()=>Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context) => new Edit(list: widget.list, index: widget.index,),
              )
            ),
            backgroundColor: Colors.blue[900]
          ),
          SizedBox(width: 10.0),
          FloatingActionButton(
            heroTag: 'btn_delete',
            child: new Icon(Icons.restore_from_trash_sharp),
            onPressed: ()=>confirm(context),
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
        child: new Container(
          // height: 270.0, 
          padding: const EdgeInsets.all(20.0),
          child: new Card(
            child: new Center(
              child: new Column(
                children: <Widget>[

                  new Padding(padding: const EdgeInsets.only(top: 30.0),),
                  new Text(widget.list[widget.index]['username'], style: new TextStyle(fontSize: 40.0),),
                  Divider(),
                  new Text("Rol : ${widget.list[widget.index]['nivel']}", style: new TextStyle(fontSize: 28.0),),
                  new Padding(padding: const EdgeInsets.only(top: 30.0),),
                  SizedBox(height:30.0),
                  Image.asset('assets/images/home2.png', height: 120.0, width: 200.0),

                  // new Row(
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: <Widget>[
                  //     new RaisedButton(
                  //     child: new Text("EDITAR"),                  
                  //     color: Colors.blueAccent,
                  //     shape: new RoundedRectangleBorder(
                  //             borderRadius: new BorderRadius.circular(30.0)),
                  //     onPressed: ()=>Navigator.of(context).push(
                  //         new MaterialPageRoute(
                  //           builder: (BuildContext context)=>new EditData(list: widget.list, index: widget.index,),
                  //         )
                  //       ),                    
                  //   ),
                  //   VerticalDivider(),
                  //   new RaisedButton(
                  //     child: new Text("ELIMINAR"),                  
                  //     color: Colors.redAccent,
                  //     shape: new RoundedRectangleBorder(
                  //             borderRadius: new BorderRadius.circular(30.0)),
                  //     onPressed: ()=>confirm(context),                
                  //   ),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}