class UserTokenData {
  final String accessToken;
  final DateTime expiration;
  final String refreshToken;

  const UserTokenData({
    required this.accessToken,
    required this.expiration,
    required this.refreshToken,
  });

  UserTokenData.fromJson(Map<String, dynamic> json)
      : accessToken = json['access_token'] ?? '',
        expiration = DateTime.parse(json['expires_in'] ?? ''),
        refreshToken = json['refresh_token'] ?? '';

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'expires_in': expiration.toIso8601String(),
        'refresh_token': refreshToken
      };
}
