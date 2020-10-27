// 参数
// {"identifier": "tongweizj", "password":  "tw273634"}
const String GQL_USER_LOGIN = r'''

mutation UserLogin($identifier: String!, $password: String! ) {
  login(input: { identifier: $identifier, password: $password }) {
    jwt
    user {
      id
      username
      email
    }
  }
}

''';
