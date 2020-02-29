import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unhcr_camps/Models/Camps.dart';
import 'package:unhcr_camps/main.dart';
var fs = Firestore.instance;
class FireStorage {
  Future<void> addCamps(CampsInfo camps) async {
    await fs.collection("Camps").document(camps.campCode).setData(camps.toJson());
  }
Future<List<CampsInfo>> getCamps() async {
    List<CampsInfo> camps=[];
    QuerySnapshot getcamp =await fs.collection("Camps").getDocuments();
    var listcamp=getcamp.documents;
    for(int i=0;i<listcamp.length;i++){
      camps.add(CampsInfo.fromDoc(listcamp[i]));
    }
    return camps;
}
}