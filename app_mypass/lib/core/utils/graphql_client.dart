import 'package:flutter/material.dart';
import 'package:app_mypass/core/utils/utils.dart';
import 'package:app_mypass/core/values/values.dart';
import 'package:app_mypass/ui/widgets/widgets.dart';
import 'package:app_mypass/global.dart';
import 'package:graphql/client.dart';

class GraphqlClientUtil {
  static OptimisticCache cache = OptimisticCache(
    dataIdFromObject: typenameDataIdFromObject,
  );

  static client() {
    HttpLink _httpLink = HttpLink(
      uri: '$SERVER_STRAPI_GRAPHQL_URL/graphql',
    );

    if (Global.profile?.jwt != null) {
      final AuthLink _authLink = AuthLink(
        getToken: () => 'Bearer ${Global.profile.jwt}',
      );
      final Link _link = _authLink.concat(_httpLink);
      return GraphQLClient(
        cache: cache,
        link: _link,
      );
    } else {
      return GraphQLClient(
        cache: cache,
        link: _httpLink,
      );
    }
  }

  /// 错误处理
  static _formatException(BuildContext context, OperationException exception) {
    var statusCode = '';
    try {
      print(exception.toString());
      statusCode = exception
          .graphqlErrors[0]?.extensions["exception"]["output"]["statusCode"]
          .toString();
      if (statusCode == '') {
        statusCode = exception.graphqlErrors[0]?.extensions["exception"]["code"]
            .toString();
      }
    } catch (e) {}

    switch (statusCode) {
      case '400': // 重新登录
        toastInfo(msg: "错误请求，提交数据错误！");
        break;
      case '401': // 没有认证
      case '403': // 没有授权
        toastInfo(msg: "账号无效、服务没有授权，请重新登录！");
        return goLoginPage(context);
      // break;
      default:
        toastInfo(msg: exception.toString());
    }
    throw exception;
  }

  // 查询
  static Future query({
    @required BuildContext context,
    @required String schema,
    Map<String, dynamic> variables,
  }) async {
    QueryOptions options = QueryOptions(
      documentNode: gql(schema),
      variables: variables,
    );

    QueryResult result = await client().query(options);

    if (result.hasException) {
      _formatException(context, result.exception);
    }

    return result;
  }

  // 操作
  static Future mutate({
    @required BuildContext context,
    @required String schema,
    Map<String, dynamic> variables,
  }) async {
    MutationOptions options = MutationOptions(
      documentNode: gql(schema),
      variables: variables,
    );

    QueryResult result = await client().mutate(options);
    print("result");
    print(result);
    if (result.hasException) {
      _formatException(context, result.exception);
    }

    return result;
  }
}
