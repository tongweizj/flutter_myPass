import 'package:app_mypass/core/entitys/entitys.dart';
import 'package:app_mypass/core/graphql/graphql.dart';
import 'package:app_mypass/core/graphql/password.dart';
import 'package:app_mypass/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

/// 用户
class GqlPasswordAPI {
  /// 拉用户的密码列表
  static Future<PasswordsListResponseEntity> getUserPasswordList({
    @required BuildContext context,
    Map<String, dynamic> params,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
        context: context, schema: GQL_Passwords_List, variables: params);
    print("response.data.toString()");
    print(response.data.data["appPasswords"].toString());
    return PasswordsListResponseEntity.fromJson(response.data.data);
  }

  /// 创建新密码
  static createUserPassword(
      {@required BuildContext context, Map<String, dynamic> params}) async {
    QueryResult response = await GraphqlClientUtil.mutate(
        context: context, schema: GQL_Password_Add, variables: params);
    print("response.data.toString()");
    print(response.data.data["appPasswords"].toString());
    // PasswordsListResponseEntity.fromJson(response.data.data)
    return true;
  }

  /// 更新密码
  static updateUserPassword(
      {@required BuildContext context, Map<String, dynamic> params}) async {
    QueryResult response = await GraphqlClientUtil.mutate(
        context: context, schema: GQL_Password_Update, variables: params);
    print("response.data.toString()");
    print(response.data.data["appPasswords"].toString());
    // PasswordsListResponseEntity.fromJson(response.data.data)
    return true;
  }

  /// 删除密码
  static deleteUserPassword(
      {@required BuildContext context, Map<String, dynamic> params}) async {
    QueryResult response = await GraphqlClientUtil.mutate(
        context: context, schema: GQL_Password_delete, variables: params);
    print("response.data.toString()");
    print(response.data.data["appPasswords"].toString());
    // PasswordsListResponseEntity.fromJson(response.data.data)
    return true;
  }
}
