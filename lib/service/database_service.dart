import 'package:assignment/models/subscription_model.dart';
import 'package:assignment/models/user_data.dart';
import 'package:assignment/utils/global_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  /**
   * USER DATABASE SERVICES
   */
  addUser(String userId, UserData userData) async {
    // Add a new document with a generated ID
    db
        .collection("Users")
        .doc(userId)
        .set(userData.toMap())
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
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
    for (var user in allUserList) {
      if (user.userId == userId) {
        return user;
      }
    }
    print("User not found!");
    throw Exception("User not found.");
    // return allUserList[0];
  }

  /// SUBSCRIPTION DATABASE SERVICES
  // addSubscriptionToUser(
  //     String userId, Map<String, String> subsciptionData) async {
  //   db
  //       .collection("Users")
  //       .doc(userId)
  //       .update({"subscription": subsciptionData})
  //       .then((value) => print("User Updated"))
  //       .catchError((error) => print("Failed to update subscription: $error"));
  // }

  addSubscriptionToUser(SubscriptionModel subsciptionData) async {
    // Add a new document with a generated ID
    db
        .collection("Subscriptions")
        .doc()
        .set(subsciptionData.toMap())
        .then((value) => print("Subscriptions Added"))
        .catchError((error) => print("Failed to add Subscriptions: $error"));
  }

  Future<List<SubscriptionModel>> getAllSubscriptions() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await db.collection("Subscriptions").get();
    return snapshot.docs
        .map((docSnapshot) =>
            SubscriptionModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  Future<List<SubscriptionModel>> getSubscription(String userId) async {
    List<SubscriptionModel> allUserList = await getAllSubscriptions();
    List<SubscriptionModel> subsForUser = [];
    for (var user in allUserList) {
      if (user.userId == userId) {
        subsForUser.add(user);
      }
    }
    if (subsForUser.isNotEmpty) {
      return subsForUser;
    }
    print("User not found!");
    throw Exception("User not found.");
    // return allUserList[0];
  }
}
