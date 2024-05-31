class SpeakerModel {
  String userId;
  String username;
  String profileImageUrl;
  String emailId;
  String firstName;
  String lastName;
  String? bio;
  String? userInitials;
  int? profileColor;
  bool hasProfilePicture;
  String jobTitle;

  SpeakerModel(
      {required this.userId,
      required this.username,
      required this.profileImageUrl,
      required this.emailId,
      required this.firstName,
      required this.lastName,
      required this.bio,
      required this.userInitials,
      required this.profileColor,
      required this.hasProfilePicture,
      required this.jobTitle});

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "username": username,
      "profileImageUrl": profileImageUrl,
      "emailId": emailId,
      "firstName": firstName,
      "lastName": lastName,
      "bio": bio,
      "userInitials": firstName[0] + "" + lastName[0],
      "profileColor": profileColor,
      "hasProfilePicture": hasProfilePicture,
      "jobTitle": jobTitle,
    };
  }

  static SpeakerModel fromJson(Map<String, dynamic> json) {
    return SpeakerModel(
      userId: json["userId"] ?? "",
      username: json["username"] ?? "",
      profileImageUrl: json["profileImageUrl"] ?? "",
      emailId: json["emailId"] ?? "",
      firstName: json["firstName"] ?? "U",
      lastName: json["lastName"] ?? "K",
      bio: json["bio"] ?? "",
      userInitials: getUserInitial(json),
      profileColor: json["profileColor"] ?? 7,
      hasProfilePicture: json["hasProfilePicture"] ?? false,
      jobTitle: json["jobTitle"] ?? "",
    );
  }

  static List<SpeakerModel> fromJSONList(List<dynamic> json) {
    List<SpeakerModel> speakerModel = [];
    for (var i = 0; i < json.length; i++) {
      speakerModel.add(SpeakerModel.fromJson(json[i]));
    }
    return speakerModel;
  }

  static List<Map<String, dynamic>> toJsonList(List<SpeakerModel> list) {
    List<Map<String, dynamic>> jsonList = [];
    for (var i = 0; i < list.length; i++) {
      jsonList.add(list[i].toJson());
    }
    return jsonList;
  }

  static String getUserInitial(Map<String, dynamic> json) {
    var firstLetter = json["firstName"] ?? "U";
    var lastLetter = json["lastName"] ?? "K";
    return firstLetter[0] + lastLetter[0];
  }
}
