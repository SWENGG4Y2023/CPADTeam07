import 'package:assignment/models/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  addUser(String userId, Map<String, String> userData) async {
    // Add a new document with a generated ID
    db.collection("Users").add(userData).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future<List<UserData>> getAllUsers() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await db.collection("Users").get();
    return snapshot.docs
        .map((docSnapshot) => UserData.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  Future<UserData> getUser(String userId) async {
    List<UserData> allUserList = await getAllUsers();
    return allUserList[0];
  }
}
