import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:unhcr_camps/Services/firebase.dart';

import 'Models/Camps.dart';

class addCamps extends StatefulWidget {
  CampsInfo campsInfo;

  addCamps({this.campsInfo});

  @override
  _addCampsState createState() => _addCampsState();
}

class _addCampsState extends State<addCamps> {
  FireStorage fireStorage = new FireStorage();
  TextEditingController campName = TextEditingController();
  TextEditingController campCode = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController tentsCount = TextEditingController();
  TextEditingController familyCounts = TextEditingController();
  TextEditingController needs = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.campsInfo != null) {
      campName.text = widget.campsInfo.campName;
      campCode.text = widget.campsInfo.campCode;
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
        title: Text("معلومات المخيم"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: campName,
              decoration: InputDecoration(
                labelText: "اسم المخيم",
              ),
            ),
            TextField(
              readOnly: (widget.campsInfo == null) ? false : true,
              controller: campCode,
              decoration: InputDecoration(
                labelText: "كود المخيم",
              ),
            ),
            TextField(
              controller: location,
              decoration: InputDecoration(
                labelText: "الموقع",
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: tentsCount,
              decoration: InputDecoration(
                labelText: "عدد الخيم",
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: familyCounts,
              decoration: InputDecoration(
                labelText: "عدد العائلات",
              ),
            ),
            TextField(
              controller: needs,
              decoration: InputDecoration(
                labelText: "عدد الأشخاص",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                (widget.campsInfo == null)
                    ? Column(
                        children: <Widget>[
//                          GoogleMap(
//                            onMapCreated: _onMapCreated,
//                            initialCameraPosition: CameraPosition(
//                              target: LatLng (0,0),
//                              zoom: 11.0,
//                            ),
//                          ),
                          RaisedButton(
                            child: Text("اضافة المخيم"),
                            onPressed: () {
                              fireStorage.addCamps(CampsInfo(
                                  campName: campName.text,
                                  campCode: campCode.text,
                                  location: location.text,
                                  needs: needs.text,
                                  tentsCount: int.parse(tentsCount.text),
                                  familyCounts: int.parse(familyCounts.text)));
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      )
                    : Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, top: 10.0, right: 0.0, bottom: 0.0),
                          child: Center(
                            child: Image.asset(
                              'assets/imgs/map.jpg',
                              height: 214,
                            ),
                          ),
                        ),
                        RaisedButton(
                            child: Text("تعديل معلومات المخيم"),
                            onPressed: () {
                              fireStorage.updateCamps(CampsInfo(
                                  campName: campName.text,
                                  campCode: campCode.text,
                                  location: location.text,
                                  needs: needs.text,
                                  tentsCount: int.parse(tentsCount.text),
                                  familyCounts: int.parse(familyCounts.text)));
                              Navigator.pop(context);
                            },
                          ),
                      ],
                    ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
