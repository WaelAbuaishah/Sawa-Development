






import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:unhcr_camps/Services/firebase.dart';

import 'Models/Camps.dart';

class addCamps extends StatefulWidget {
  CampsInfo campsInfo;
  addCamps({this.campsInfo});
  @override
  _addCampsState createState() => _addCampsState();
}

class _addCampsState extends State<addCamps> {
  FireStorage fireStorage=new FireStorage();
  TextEditingController campName= TextEditingController();
  TextEditingController campCode= TextEditingController();
  TextEditingController location= TextEditingController();
  TextEditingController tentsCount= TextEditingController();
  TextEditingController familyCounts=TextEditingController();
  TextEditingController needs=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camps Info"),
      ),
      body: Container(
        padding:const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                TextField(
                  controller: campName,
                  decoration: InputDecoration(
                    labelText: "Camp Name",
                  ),

                ),
                TextField(
                  controller: campCode,
                  decoration: InputDecoration(
                    labelText: "camp Code ",
                  ),

                ),
                TextField(
                  controller: location,
                  decoration: InputDecoration(
                    labelText: "location",
                  ),

                ),
                TextField(
                  controller: tentsCount,
                  decoration: InputDecoration(
                    labelText: "tents Count",
                  ),

                ),
                TextField(
                  controller: familyCounts,
                  decoration: InputDecoration(
                    labelText: "family Counts",
                  ),

                ),
                TextField(
                  controller: needs,
                  decoration: InputDecoration(
                    labelText: "Needs",
                  ),

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("Add Camps"),
                      onPressed: ()=> fireStorage.addCamps(CampsInfo(campName: campName.text,campCode: campCode.text,location: location.text,needs: needs.text,tentsCount:int.parse( tentsCount.text),familyCounts: int.parse(familyCounts.text))),
                    ),
                  ],
                )

              ],


            ),
          ),
        

    );
  }
}
