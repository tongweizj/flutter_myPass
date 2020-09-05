import 'package:app_mypass/core/entitys/entitys.dart';
import 'package:app_mypass/core/graphql/graphql.dart';
import 'package:app_mypass/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

/// 用户
class GqlUserAPI {
  /// 登录
  static Future<UserLoginResponseEntity> login({
    @required BuildContext context,
    @required UserLoginRequestEntity variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
        context: context,
        schema: GQL_USER_LOGIN,
        variables: variables.toJson());
    print("response.data.toString()");
    print(response.data["login"]["jwt"].toString());
    return UserLoginResponseEntity.fromJson(response.data["login"]);
  }

  /// 注册
  static Future<UserRegisterResponseEntity> register({
    @required BuildContext context,
    @required UserRegisterRequestEntity variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
        context: context,
        schema: GQL_USER_REGISTER,
        variables: variables.toJson());

    return UserRegisterResponseEntity.fromJson(response.data["register"]);
  }
}
