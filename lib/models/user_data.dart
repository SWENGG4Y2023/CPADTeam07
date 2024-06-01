import 'package:assignment/models/subscription_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String userId;
  String fullName;
  String emailId;
  String phone;
  String bank;
  String accountNumber;
  int accountBalance;
  // final List<SubscriptionModel> subscriptionModel;
  // String createdAt;
  // String updatedAt;
  // String baseLocationName;
  // String baseLocationCode;

  UserData({
    required this.userId,
    required this.fullName,
    required this.emailId,
    required this.phone,
    required this.bank,
    required this.accountNumber,
    required this.accountBalance,
    // required this.subscriptionModel,
    // required this.status,
    // required this.role,
    // required this.createdAt,
    // required this.updatedAt,
    // required this.baseLocationName,
    // required this.baseLocationCode,
  });

  static fromJson(json) {
    return UserData(
      userId: json["userId"],
      fullName: json["fullName"],
      emailId: json["emailId"],
      phone: json["phone"],
      bank: json["bank"] ?? "",
      accountNumber: json["accountNumber"],
      accountBalance: json["accountBalance"],
      // subscriptionModel:
      //     SubscriptionModel.fromJSONList(json["subscriptionModel"]),
      // role: json["role"],
      // createdAt: json["createdAt"],
      // updatedAt: json["updatedAt"] ?? "",
      // baseLocationName: json["baseLocationName"],
      // baseLocationCode: json["baseLocationCode"],
    );
  }

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "fullName": fullName,
        "emailId": emailId,
        "phone": phone,
        "bank": bank,
        "accountNumber": accountNumber,
        "accountBalance": accountBalance,
        // "subscriptionModel": SubscriptionModel.toJsonList(subscriptionModel),
        // "status": status,
        // "role": role,
        // "createdAt": createdAt,
        // "updatedAt": updatedAt,
        // "baseLocationName": baseLocationName,
        // "baseLocationCode": baseLocationCode,
      };

  // List<UserData> listFromJson(json) {
  //   List<UserData> list = [];
  //   for (var i in json) {
  //     list.add(UserData.fromJson(i));
  //   }
  //   return list;
  // }

  UserData.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : userId = doc.data()!["userId"],
        fullName = doc.data()!["fullName"],
        emailId = doc.data()!["emailId"],
        phone = doc.data()!["phone"],
        bank = doc.data()!["bank"],
        accountNumber = doc.data()!["accountNumber"],
        accountBalance = doc.data()!["accountBalance"];
        // subscriptionModel = doc.data()!["subscriptionModel"] == null
        //     ? []
        //     : doc.data()!["subscriptionModel"].cast<SubscriptionModel>();
}
