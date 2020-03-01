import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unhcr_camps/Models/Camps.dart';
import 'package:unhcr_camps/main.dart';
final CollectionReference fs = Firestore.instance.collection("Camps");
class FireStorage {
  Future<void> addCamps(CampsInfo camps) async {
    await fs.document(camps.campCode).setData(camps.toJson());
  }
  Future<void> updateCamps(CampsInfo camps) async {
    await fs.document(camps.campCode).updateData(camps.toJson());
  }
Future<List<CampsInfo>> getCamps() async {
    List<CampsInfo> camps=[];
    QuerySnapshot getcamp =await fs.getDocuments();
    var listcamp=getcamp.documents;
    for(int i=0;i<listcamp.length;i++){
      camps.add(CampsInfo.fromDoc(listcamp[i]));
    }
    return camps;
}
}