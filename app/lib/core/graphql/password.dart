// 参数
// {
//     "pass_email":"xxx@gmail.com",
//     "pass_username":"111111",
//     "pass_website":"pass_website",
//     "pass_password":"pass_password",
//   "usr": "5f4ad448af3abb000d8be066"
//   }
const String GQL_Password_Add = r'''
mutation addAppPassword(
  $pass_username: String,
  $pass_email: String,
  $pass_website: String,
  $web_letter_logo: String,
  $pass_password: String,
  $usr:ID){
  createAppPassword(
    input:{
      data:{
        pass_email:$pass_email,
    		pass_username:$pass_username,
    		pass_website:$pass_website,
        web_letter_logo:$web_letter_logo
    		pass_password:$pass_password,
        user:$usr
      }
    }
  ){
    appPassword{
      pass_email
    }
    
  }
}
''';

/// 更新密码
/// {
//   "pass_email":"xxx@gmail.com",
//   "pass_username":"111111",
//   "pass_website":"pass_website",
//   "pass_password":"pass_password",
// "pass_id": "5f7a6e219a0c1a000dae6d8d",
// "usr": "5f4ad448af3abb000d8be066"
// }
const String GQL_Password_Update = r'''
mutation updateAppPassword(
  $pass_username: String,
  $pass_email: String,
  $pass_website: String,
  $web_letter_logo: String,
  $pass_password: String,
  $pass_id: ID!,
  $usr:ID){
  updateAppPassword(
    input:{
      where: {id:$pass_id}
      data:{
        pass_email:$pass_email,
    		pass_username:$pass_username,
    		pass_website:$pass_website,
    		pass_password:$pass_password,
        web_letter_logo:$web_letter_logo
        user:$usr
      }
    }
  ){
    appPassword{
      pass_email
    }
    
  }
}
''';

/// 删除密码

const String GQL_Password_delete = r'''
mutation deleteAppPassword(
  $pass_id: ID!
 ){
  deleteAppPassword(
    input:{
      where: {id:$pass_id}
    }
  ){
    appPassword{
      id
    }
  }
}
''';
