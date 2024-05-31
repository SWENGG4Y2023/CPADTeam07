class UserSettingsModel {
  String userId;
  String firstName;
  String lastName;
  String emailId;
  String username;
  String profileImageUrl;
  String? bio;
  String status;
  String role;
  String createdAt;
  String updatedAt;
  String baseLocationCode;
  String baseLocationName;
  String userInitials;
  int? userInitialsColor;
  bool receiveNotifications;
  int notificationInterval;

  UserSettingsModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.username,
    required this.profileImageUrl,
    required this.bio,
    required this.status,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.baseLocationCode,
    required this.baseLocationName,
    required this.userInitials,
    required this.userInitialsColor,
    required this.receiveNotifications,
    required this.notificationInterval,
  });

  // write to json method below to convert the object to json

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "firstName": firstName,
      "lastName": lastName,
      "emailId": emailId,
      "username": username,
      "profileImageUrl": profileImageUrl,
      "bio": bio,
      "status": status,
      "role": role,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "baseLocationCode": baseLocationCode,
      "baseLocationName": baseLocationName,
      "userInitials": userInitials,
      "userInitialsColor": userInitialsColor,
      "receiveNotifications": receiveNotifications,
      "notificationInterval": notificationInterval,
    };
  }

  // Method to create an object from a map

  static UserSettingsModel fromJson(Map<String, dynamic> json) {
    return UserSettingsModel(
      userId: json['userId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      emailId: json['emailId'],
      username: json['username'],
      profileImageUrl: json['profileImageUrl'],
      bio: json['bio'],
      status: json['status'],
      role: json['role'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      baseLocationCode: json['baseLocationCode'],
      baseLocationName: json['baseLocationName'],
      userInitials: json['userInitials'],
      userInitialsColor: json['userInitialsColor'],
      receiveNotifications: json['receiveNotifications'],
      notificationInterval: json['notificationInterval'],
    );
  }

  static UserSettingsModel copyWith({
    String? userId,
    String? firstName,
    String? lastName,
    String? emailId,
    String? username,
    String? profileImageUrl,
    String? bio,
    String? status,
    String? role,
    String? createdAt,
    String? updatedAt,
    String? baseLocationCode,
    String? baseLocationName,
    String? userInitials,
    int? userInitialsColor,
    bool? receiveNotifications,
    int? notificationInterval,
  }) {
    return UserSettingsModel(
      userId: userId ?? "",
      firstName: firstName ?? "",
      lastName: lastName ?? "",
      emailId: emailId ?? "",
      username: username ?? "",
      profileImageUrl: profileImageUrl ?? "",
      bio: bio ?? "",
      status: status ?? "",
      role: role ?? "",
      createdAt: createdAt ?? "",
      updatedAt: updatedAt ?? "",
      baseLocationCode: baseLocationCode ?? "",
      baseLocationName: baseLocationName ?? "",
      userInitials: userInitials ?? "",
      userInitialsColor: userInitialsColor ?? 0,
      receiveNotifications: receiveNotifications ?? false,
      notificationInterval: notificationInterval ?? 0,
    );
  }

  static UserSettingsModel copyFromJson(json) {
    return UserSettingsModel(
      userId: json['userId'] ?? "",
      firstName: json['firstName'] ?? "",
      lastName: json['lastName'] ?? "",
      emailId: json['emailId'] ?? "",
      username: json['username'] ?? "",
      profileImageUrl: json['profileImageUrl'] ?? "",
      bio: json['bio'] ?? "",
      status: json['status'] ?? "",
      role: json['role'] ?? "",
      createdAt: json['createdAt'] ?? "",
      updatedAt: json['updatedAt'] ?? "",
      baseLocationCode: json['baseLocationCode'] ?? "",
      baseLocationName: json['baseLocationName'] ?? "",
      userInitials: json['userInitials'] ?? "",
      userInitialsColor: json['userInitialsColor'] ?? 0,
      receiveNotifications: json['receiveNotifications'] ?? false,
      notificationInterval: json['notificationInterval'] ?? 0,
    );
  }
}
