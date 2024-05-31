class PrincipalData {
  String digitalId;
  String givenName;
  String familyName;
  String email;
  String userId;

  PrincipalData({
    required this.digitalId,
    required this.givenName,
    required this.familyName,
    required this.email,
    required this.userId,
  });

  static PrincipalData fromJson(json) {
    return PrincipalData(
      digitalId: json["digitalId"],
      givenName: json["givenName"],
      familyName: json["familyName"],
      email: json["email"],
      userId: json["userId"],
    );
  }

  Map<String, dynamic> toJson() => {
        "digitalId": digitalId,
        "givenName": givenName,
        "familyName": familyName,
        "email": email,
        "userId": userId,
      };
}
