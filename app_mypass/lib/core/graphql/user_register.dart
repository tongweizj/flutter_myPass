// 参数
// {
//   "username": "username",
//   "email": "email@gmail.com",
//   "password":"123456"
// }
const String GQL_USER_REGISTER = r'''

mutation UserRegiste($username: String!, $email: String!, $password: String!) {
  register(input: { username: $username, email: $email, password: $password }) {
    user {
      id
      username
      email
      confirmed
      blocked
      role {
        id
        name
        description
        type
      }
    }
  }
}

''';
