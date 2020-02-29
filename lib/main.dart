import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unhcr_camps/Models/Camps.dart';
import 'package:unhcr_camps/Services/firebase.dart';
import 'package:unhcr_camps/addCamps.dart';


void main(){
  runApp(new MaterialApp(
    title: "Camps",
    home: new Camps(),
  ));
}

class Camps extends StatefulWidget {
  @override
  _CampsState createState() => _CampsState();
}

class _CampsState extends State<Camps> {
  FireStorage fireStorage=new FireStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camps"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: ()=>
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => addCamps()),
            )

          )

        ],
      ),
body: FutureBuilder(
  future: fireStorage.getCamps(),
    builder: (BuildContext context,
    AsyncSnapshot<List<CampsInfo>> snapshot){
    if(snapshot.hasData&&snapshot.data.isNotEmpty)
    return Expanded(
      child: Material(
        child: ListView.builder(
          itemCount: snapshot.data.length,
    itemBuilder: (BuildContext context, int index) {
      final item = snapshot.data[index];
      return ListTile(
        onTap: ()=>{},
        title: Text(snapshot.data[index].campName),
        subtitle: Text(snapshot.data[index].location),
      );
    }
        ),
      ),
    );
else return Container(
      child: Center(
        child: Text("Now Data"),
      ),
    );

    }),

     // body: ,
    );
  }
}
