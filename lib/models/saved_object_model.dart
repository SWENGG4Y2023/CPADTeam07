class SavedObjectModel {
  final String savedObjectUUID;
  final String type;
  final String userId;
  final String savedObjectId;

  SavedObjectModel(
      {required this.savedObjectUUID,
      required this.type,
      required this.userId,
      required this.savedObjectId});

  Map<String, dynamic> toJson() {
    return {
      "savedObjectUUID": savedObjectUUID,
      "type": type,
      "userId": userId,
      "savedObjectId": savedObjectId
    };
  }

  static SavedObjectModel fromJson(Map<String, dynamic> json) {
    return SavedObjectModel(
      savedObjectUUID: json["savedObjectUUID"],
      type: json["type"],
      userId: json["userId"],
      savedObjectId: json["savedObjectId"],
    );
  }
}
