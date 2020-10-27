// 参数
// {
//   "username": "demo"
// }
const String GQL_Passwords_List = r'''
query UserPass($username: String!) {
  appPasswords(where: {user:{username: $username } }) {
      id
      pass_username
      pass_email
      pass_password
      pass_website
    web_letter_logo
    web_logo
  }
}
''';
