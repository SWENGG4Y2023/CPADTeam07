class SavedObjectPayloadModel {
  final String savedObjectUUID;
  final String type;

  SavedObjectPayloadModel({
    required this.savedObjectUUID,
    required this.type,
  });

  Map<String, dynamic> toJSON() {
    return {
      "savedObjectUUID": savedObjectUUID,
      "type": type,
    };
  }

  static SavedObjectPayloadModel fromJson(Map<String, dynamic> json) {
    return SavedObjectPayloadModel(
      savedObjectUUID: json["savedObjectUUID"],
      type: json["type"],
    );
  }
}
