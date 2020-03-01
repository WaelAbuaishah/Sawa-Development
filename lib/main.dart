import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unhcr_camps/Models/Camps.dart';
import 'package:unhcr_camps/Services/firebase.dart';
import 'package:unhcr_camps/addCamps.dart';

void main() {
  runApp(new MaterialApp(
    title: "Sawa",
    home: new Camps(),
  ));
}

class Camps extends StatefulWidget {
  @override
  _CampsState createState() => _CampsState();
}

class _CampsState extends State<Camps> {
  FireStorage fireStorage = new FireStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Text("إضافة"),
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => addCamps()),
                )),
        body: _buildBody(context)
        // body: ,
        );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: <Widget>[_buildBackground(), _buildBodyContent()],
    );
  }

  Widget _buildListView(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: fireStorage.getCamps(),
          builder:
              (BuildContext context, AsyncSnapshot<List<CampsInfo>> snapshot) {
            if (snapshot.hasData && snapshot.data.isNotEmpty)
              return Container(
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = snapshot.data[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _getListItemUI(item, index),
//                        child: ListTile(
//                          onTap: () => Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => addCamps(
//                                      campsInfo: item,
//                                    )),
//                          ),
//                          title: Text(snapshot.data[index].campName),
//                          subtitle: Text(snapshot.data[index].location),
//                        ),
                      );
                    }),
              );
            else
              return Container(
                child: Center(
                  child: Text("لا يوجد مخيمات"),
                ),
              );
          }),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft)),
    );
  }

  Widget _buildBodyContent() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          _buildIcon(),
          Expanded(child: _buildListView(context))
        ],
      ),
    );
  }

  Widget _buildIcon() {
    double padding = 10.0;
//    if (kIsWeb) {
//      padding = 20.0;
//    }

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/imgs/sawa.png',
              width: 200,
              height: 100,
            ),
          ),
          new Container(
              padding: const EdgeInsets.only(left: 12.0, right: 1.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new TextField(
                          decoration: new InputDecoration(
                              labelText: "أدخل اسم المخيم للبحث"),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ], // Only numbers can be entered
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Card(
                        color: Colors.lightBlueAccent,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                          child: Text(
                            "ابحث",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget _getListItemUI(CampsInfo campsInfo, int index) {
    double elevationValue = 12.0;
//    if (kIsWeb) {
//      elevationValue = 2.0;
//    }

    return new Card(
        elevation: elevationValue,
        color: Colors.white,
        child: new Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new ListTile(
                leading: new Image.asset(
                  "assets/imgs/" +index.toString()+"a.png",
                  fit: BoxFit.contain,
                  width: 60,
                  height: 100,
                ),
                title: new Text(
                  campsInfo.campName,
                  style: new TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
                subtitle: Expanded(
                  child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(campsInfo.location,
                            style: new TextStyle(
                                fontSize: 13.0, fontWeight: FontWeight.normal)),
                        new Text(' عدد العوائل : ${campsInfo.tentsCount}',
                            style: new TextStyle(
                                fontSize: 11.0, fontWeight: FontWeight.normal)),
                      ]),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => addCamps(
                            campsInfo: campsInfo,
                          )),
                ),
              ),
            )
          ],
        ));
  }
}
