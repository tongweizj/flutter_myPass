class PasswordsListRequestEntity {
  PasswordsListRequestEntity({
    required this.username,
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
    required this.appPasswords,
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
    required this.id,
    required this.passUsername,
    required this.passEmail,
    this.passPassword,
    required this.passPlainPassword,
    required this.passWebsite,
    this.webLetterLogo,
    this.webLogo,
  });

  String id;
  String passUsername;
  String passEmail;
  dynamic passPassword;
  String passPlainPassword;
  String passWebsite;
  dynamic webLetterLogo;
  dynamic webLogo;

  factory AppPasswordModel.fromJson(Map<String, dynamic> json) =>
      AppPasswordModel(
        id: json["id"],
        passUsername: json["username"],
        passEmail: json["email"],
        passPassword: json["password"].toString(),
        passPlainPassword: '123456',
        //CipherUtil.decryptPassword(password: json["password"].toString()),//TODO 因为添加的时候，密码没有加密，所以现在有问题
        passWebsite: json["website"],
        webLetterLogo: json["webLetterLogo"],
        webLogo: json["web_logo"] ?? '',
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
