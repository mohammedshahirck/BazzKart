class LoginInArgModel {
  final String refreshToken;
  final String accessToken;
  LoginInArgModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginInArgModel.fromJson(Map<String, dynamic> json) {
    return LoginInArgModel(
      refreshToken: json['refreshToken'],
      accessToken: json['accessToken'],
    );
  }
}
