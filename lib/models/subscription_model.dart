import 'package:cloud_firestore/cloud_firestore.dart';

class SubscriptionModel {
  String subImage;
  String subId;
  String userId;
  String name;
  String description;
  String category;
  String firstPayment;
  int currency;

  SubscriptionModel(
      {required this.subId,
      required this.subImage,
      required this.userId,
      required this.name,
      required this.description,
      required this.category,
      required this.firstPayment,
      required this.currency});

  Map<String, dynamic> toMap() {
    return {
      "subId": subId,
      "subImage": subImage,
      "userId": userId,
      "name": name,
      "description": description,
      "category": category,
      "firstPayment": firstPayment,
      "currency": currency,
    };
  }

  static SubscriptionModel fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      subId: json["subId"] ?? "",
      subImage: json["subImage"] ?? "",
      userId: json["userId"] ?? "",
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      category: json["category"] ?? "",
      firstPayment: json["firstPayment"] ?? "",
      currency: json["currency"] ?? 99.99,
    );
  }

  SubscriptionModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc)
      : subId = doc.data()!["subId"],
        subImage = doc.data()!["subImage"],
        userId = doc.data()!["userId"],
        name = doc.data()!["name"],
        description = doc.data()!["description"],
        category = doc.data()!["category"],
        firstPayment = doc.data()!["firstPayment"],
        currency = doc.data()!["currency"];

  static List<SubscriptionModel> fromJSONList(List<dynamic> json) {
    List<SubscriptionModel> eventLinksModel = [];
    for (var i = 0; i < json.length; i++) {
      eventLinksModel.add(SubscriptionModel.fromJson(json[i]));
    }
    return eventLinksModel;
  }

  static List<Map<String, dynamic>> toJsonList(List<SubscriptionModel> list) {
    List<Map<String, dynamic>> jsonList = [];
    for (var i = 0; i < list.length; i++) {
      jsonList.add(list[i].toMap());
    }
    return jsonList;
  }

  // // get current time ensure it is in range between start and firstPayment
  // static bool shouldEventLinkBecurrency(
  //     String category, String firstPayment) {
  //   if (category.isNotEmpty && firstPayment.isNotEmpty) {
  //     DateTime currentTime = DateTime.now();
  //     DateTime startTime =
  //         new DateFormat("yyyy-MM-dd hh:mm:ss").parse(category);
  //     DateTime endTime =
  //         new DateFormat("yyyy-MM-dd hh:mm:ss").parse(firstPayment);

  //     if (currentTime.isAfter(startTime) && currentTime.isBefore(endTime)) {
  //       return true;
  //     }
  //   }
  //   return false;
  // }
// }
}
