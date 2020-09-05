import 'package:app_mypass/core/entitys/entitys.dart';
import 'package:app_mypass/core/graphql/graphql.dart';
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
}
