






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
  void initState() {
super.initState();
if(widget.campsInfo!=null) {
  campName.text = widget.campsInfo.campName;
  campCode.text=widget.campsInfo.campCode;
  tentsCount.text = widget.campsInfo.tentsCount.toString();
  familyCounts.text = widget.campsInfo.familyCounts.toString();
  location.text = widget.campsInfo.location;
  needs.text = widget.campsInfo.needs;
}
  }
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
                  readOnly: (widget.campsInfo==null)?false:true,
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
                  keyboardType:TextInputType.number,
                  controller: tentsCount,
                  decoration: InputDecoration(
                    labelText: "tents Count",
                  ),

                ),
                TextField(
                  keyboardType:TextInputType.number,
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
                    (widget.campsInfo==null)?RaisedButton(
                      child: Text("Add Camps"),
                      onPressed: (){
                        fireStorage.addCamps(
                            CampsInfo(campName: campName.text,campCode: campCode.text,
                                location: location.text,needs: needs.text,
                                tentsCount:int.parse( tentsCount.text),familyCounts: int.parse(familyCounts.text)));
                        Navigator.pop(context);
                        },
                    ):RaisedButton(
                      child: Text("update Camps"),
                      onPressed: (){
                        fireStorage.updateCamps(
                            CampsInfo(campName: campName.text,campCode: campCode.text,
                                location: location.text,needs: needs.text,
                                tentsCount:int.parse( tentsCount.text),familyCounts: int.parse(familyCounts.text)));
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )

              ],


            ),
          ),
        

    );
  }
}
