class LoginResponse {
  late String accessToken;
  late String message;
  late String tokenType;
  late String expiresAt;
  late int uid;
  late String userType;

  LoginResponse(
      {required this.accessToken,
      required this.message,
      required this.tokenType,
      required this.expiresAt,
      required this.uid,
      required this.userType});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    message = json['message'];
    tokenType = json['token_type'];
    expiresAt = json['expires_at'];
    uid = json['uid'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['message'] = this.message;
    data['token_type'] = this.tokenType;
    data['expires_at'] = this.expiresAt;
    data['uid'] = this.uid;
    data['user_type'] = this.userType;
    return data;
  }
}
