import 'dart:convert';

class PasswordsListRequestEntity {
  PasswordsListRequestEntity({
    this.username,
  });

  String username;

  factory PasswordsListRequestEntity.fromJson(Map<String, dynamic> json) =>
      PasswordsListRequestEntity(
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
      };
}

///////////////////////////////

class PasswordsListResponseEntity {
  PasswordsListResponseEntity({
    this.appPasswords,
  });

  List<AppPasswordEntity> appPasswords;

  factory PasswordsListResponseEntity.fromJson(Map<String, dynamic> json) =>
      PasswordsListResponseEntity(
        appPasswords: List<AppPasswordEntity>.from(
            json["appPasswords"].map((x) => AppPasswordEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "appPasswords": List<dynamic>.from(appPasswords.map((x) => x.toJson())),
      };
}

class AppPasswordEntity {
  AppPasswordEntity({
    this.id,
    this.passUsername,
    this.passEmail,
    this.passPassword,
    this.passWebsite,
  });

  String id;
  String passUsername;
  String passEmail;
  String passPassword;
  String passWebsite;

  factory AppPasswordEntity.fromJson(Map<String, dynamic> json) =>
      AppPasswordEntity(
        id: json["id"],
        passUsername: json["pass_username"],
        passEmail: json["pass_email"],
        passPassword: json["pass_password"],
        passWebsite: json["pass_website"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pass_username": passUsername,
        "pass_email": passEmail,
        "pass_password": passPassword,
        "pass_website": passWebsite,
      };
}
