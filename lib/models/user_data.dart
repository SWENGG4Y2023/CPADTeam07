import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String userId;
  String fullName;
  String emailId;
  String phone;
  String bank;
  String accountNumber;
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
    // required this.status,
    // required this.role,
    // required this.createdAt,
    // required this.updatedAt,
    // required this.baseLocationName,
    // required this.baseLocationCode,
  });

//   static UserData fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
//     return UserData(userId: userId, fullName: fullName, emailId: emailId, phone: phone, bank: bank, accountNumber: accountNumber)
//         userId = doc.userId,
//         fullName = doc.fullName()!["fullName"],
//         emailId = doc.emailId()!["emailId"],
//         phone = doc.phone()!["phone"],
//         bank = doc.bank()!["bank"]
// }

  UserData fromJson(json) {
    return UserData(
      userId: json["userId"],
      fullName: json["fullName"],
      emailId: json["emailId"],
      phone: json["phone"],
      bank: json["bank"] ?? "",
      accountNumber: json["accountNumber"],
      // status: json["status"],
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
      : userId = doc.id,
        fullName = doc.data()!["fullName"],
        emailId = doc.data()!["emailId"],
        phone = doc.data()!["phone"],
        bank = doc.data()?["bank"],
        accountNumber = doc.data()?["accountNumber"];
}
