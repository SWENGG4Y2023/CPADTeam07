// class EventData {
//   final String eventId;
//   final String eventTitle;
//   final String eventSubTitle;
//   final String eventDescription;
//   final String eventStart;
//   final String eventEnd;
//   final String bannerImageUrl;
//   final String eventLocationName;
//   final String type;
//   final String publishedDate;
//   // final String locationCode
//   // locationName
//   // createdOn
//   // createdBy
//   // lastChangedOn
//   // lastChangedBy
//   final List<SpeakerModel> speakersModel;
//   final List<EventLinks> eventLinksModel;
//   // final String organiser;
//   bool saved;

//   EventData({
//     required this.eventId,
//     required this.eventTitle,
//     required this.eventSubTitle,
//     required this.eventDescription,
//     required this.eventStart,
//     required this.eventEnd,
//     required this.bannerImageUrl,
//     required this.eventLocationName,
//     required this.type,
//     required this.speakersModel,
//     required this.eventLinksModel,
//     required this.publishedDate,
//     // required this.organiser,
//     required this.saved,
//   });

//   Map<String, dynamic> toJSON() {
//     return {
//       "eventId": eventId,
//       "eventTitle": eventTitle,
//       "eventSubTitle": eventSubTitle,
//       "eventDescription": eventDescription,
//       "eventStart": eventStart,
//       "eventEnd": eventEnd,
//       "bannerImageUrl": bannerImageUrl,
//       "eventLocationName": eventLocationName,
//       "type": type,
//       "publishedDate": publishedDate,
//       "speakersModel": SpeakerModel.toJsonList(speakersModel),
//       "eventLinksModel": EventLinks.toJsonList(eventLinksModel),
//       "saved": saved,
//     };
//   }

//   static EventData fromJson(Map<String, dynamic> json) {
//     return EventData(
//       eventId: json["eventId"] ?? "",
//       eventTitle: json["eventTitle"] ?? "",
//       eventSubTitle: json["eventSubTitle"] ?? "",
//       eventDescription: json["eventDescription"] ?? "",
//       eventStart: json["eventStart"] ?? "",
//       eventEnd: json["eventEnd"] ?? "",
//       bannerImageUrl: json["bannerImageUrl"] ?? "",
//       eventLocationName: json["eventLocation"] ?? "",
//       type: json["type"] ?? "",
//       publishedDate: json["publishedDate"] ?? "",
//       saved: json["isSaved"] ?? false,
//       speakersModel: SpeakerModel.fromJSONList(json["speakers"] ?? []),
//       eventLinksModel: EventLinks.fromJSONList(json["eventLinks"] ?? []),
//       // organiser: json["organiser"],
//     );
//   }

//   static List<EventData> fromJSONList(List<dynamic> json) {
//     return json
//         .map((event) => EventData(
//             eventId: event["eventId"] ?? "",
//             eventTitle: event["eventTitle"] ?? "",
//             eventSubTitle: event["eventSubTitle"] ?? "",
//             eventDescription: event["eventDescription"] ?? "",
//             eventStart: event["eventStart"] ?? "",
//             eventEnd: event["eventEnd"] ?? "",
//             bannerImageUrl: event["bannerImageUrl"] ?? "",
//             type: event["type"] ?? "",
//             eventLocationName: event["eventLocation"] ?? "",
//             publishedDate: event["publishedDate"] ?? "",
//             speakersModel: SpeakerModel.fromJSONList(event["speakers"] ?? []),
//             eventLinksModel: EventLinks.fromJSONList(event["eventLinks"] ?? []),
//             // organiser: event["organiser"] ?? "",
//             saved: event["isSaved"] ?? false))
//         .toList();
//   }
// }
