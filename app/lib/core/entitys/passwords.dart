import 'package:mypass/core/utils/cipher.dart';

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

class PasswordsListResponseModel {
  PasswordsListResponseModel({
    this.appPasswords,
  });

  List<AppPasswordModel> appPasswords;

  factory PasswordsListResponseModel.fromJson(Map<String, dynamic> json) =>
      PasswordsListResponseModel(
        appPasswords: List<AppPasswordModel>.from(
            json["appPasswords"].map((x) => AppPasswordModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "appPasswords": List<dynamic>.from(appPasswords.map((x) => x.toJson())),
      };
}

class AppPasswordModel {
  AppPasswordModel({
    this.id,
    this.passUsername,
    this.passEmail,
    this.passPassword,
    this.passPassword_plain,
    this.passWebsite,
    this.webLetterLogo,
    this.webLogo,
  });

  String id;
  String passUsername;
  String passEmail;
  dynamic passPassword;
  String passPassword_plain;
  String passWebsite;
  dynamic webLetterLogo;
  dynamic webLogo;

  factory AppPasswordModel.fromJson(Map<String, dynamic> json) =>
      AppPasswordModel(
        id: json["id"],
        passUsername: json["pass_username"],
        passEmail: json["pass_email"],
        passPassword: json["pass_password"],
        passPassword_plain:
            CipherUtil.decryptPassword(password: json["pass_password"]),
        passWebsite: json["pass_website"],
        webLetterLogo: json["web_letter_logo"],
        webLogo: json["web_logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pass_username": passUsername,
        "pass_email": passEmail,
        "pass_password": passPassword,
        "pass_website": passWebsite,
        "web_letter_logo": webLetterLogo,
        "web_logo": webLogo,
      };
}
