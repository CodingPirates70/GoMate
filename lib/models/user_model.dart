class UserModel {
  final int status;
  final String message;
  final String token;
  final AppUser? user;

  UserModel({
    required this.status,
    required this.message,
    required this.token,
    this.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    return UserModel(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      token: data['token'] ?? '',
      user: data['user'] != null ? AppUser.fromJson(data['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "data": {
        "token": token,
        "user": user?.toJson(),
      }
    };
  }
}

class AppUser {
  final String uid;
  final String email;
  final String displayName;

  AppUser({
    required this.uid,
    required this.email,
    required this.displayName,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      displayName: json['displayName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "email": email,
      "displayName": displayName,
    };
  }
}
