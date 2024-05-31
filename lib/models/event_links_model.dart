import 'package:intl/intl.dart';

class EventLinks {
  String displayText;
  String linkUrl;
  String type;
  String startDateTime;
  String endDateTime;
  bool visible;

  EventLinks(
      {required this.displayText,
      required this.linkUrl,
      required this.type,
      required this.startDateTime,
      required this.endDateTime,
      required this.visible});

  Map<String, dynamic> toJson() {
    return {
      "displayText": displayText,
      "linkUrl": linkUrl,
      "type": type,
      "startDateTime": startDateTime,
      "endDateTime": endDateTime,
      "visible": visible,
    };
  }

  static EventLinks fromJson(Map<String, dynamic> json) {
    return EventLinks(
      displayText: json["displayText"] ?? "",
      linkUrl: json["linkUrl"] ?? "",
      type: json["type"] ?? "",
      startDateTime: json["startDateTime"] ?? "",
      endDateTime: json["endDateTime"] ?? "",
      visible: shouldEventLinkBeVisible(
          json["startDateTime"] ?? "", json["endDateTime"] ?? ""),
    );
  }

  static List<EventLinks> fromJSONList(List<dynamic> json) {
    List<EventLinks> eventLinksModel = [];
    for (var i = 0; i < json.length; i++) {
      eventLinksModel.add(EventLinks.fromJson(json[i]));
    }
    return eventLinksModel;
  }

  static List<Map<String, dynamic>> toJsonList(List<EventLinks> list) {
    List<Map<String, dynamic>> jsonList = [];
    for (var i = 0; i < list.length; i++) {
      jsonList.add(list[i].toJson());
    }
    return jsonList;
  }

  // get current time ensure it is in range between start and endDateTime
  static bool shouldEventLinkBeVisible(
      String startDateTime, String endDateTime) {
    if (startDateTime.isNotEmpty && endDateTime.isNotEmpty) {
      DateTime currentTime = DateTime.now();
      DateTime startTime =
          new DateFormat("yyyy-MM-dd hh:mm:ss").parse(startDateTime);
      DateTime endTime =
          new DateFormat("yyyy-MM-dd hh:mm:ss").parse(endDateTime);

      if (currentTime.isAfter(startTime) && currentTime.isBefore(endTime)) {
        return true;
      }
    }
    return false;
  }
}
