/// 用户登录请求 - request
class UserLoginRequestEntity {
  UserLoginRequestEntity({
    this.identifier,
    this.password,
  });

  String identifier;
  String password;

  factory UserLoginRequestEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginRequestEntity(
        identifier: json["identifier"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "password": password,
      };
}

// 用户登录 - Response
class UserLoginResponseEntity {
  UserLoginResponseEntity({
    this.jwt,
    this.user,
  });

  String jwt;
  UserEntity user;

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        jwt: json["jwt"],
        user: UserEntity.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "jwt": jwt,
        "user": user.toJson(),
      };
}

//////////////////////////////////////////////////////////////////
/// 用户注册-Request
class UserRegisterRequestEntity {
  UserRegisterRequestEntity({
    this.username,
    this.email,
    this.password,
  });

  String username;
  String email;
  String password;

  factory UserRegisterRequestEntity.fromJson(Map<String, dynamic> json) =>
      UserRegisterRequestEntity(
        username: json["username"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
      };
}

/// 用户注册-Response
///
class UserRegisterResponseEntity {
  UserRegisterResponseEntity({
    this.user,
  });

  UserEntity user;

  factory UserRegisterResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserRegisterResponseEntity(
        user: UserEntity.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

//////////////////////////////////////////////////////////////////
// 用户
class UserEntity {
  UserEntity({
    this.id,
    this.username,
    this.email,
  });

  String id;
  String username;
  String email;

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        id: json["id"],
        username: json["username"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
      };
}
