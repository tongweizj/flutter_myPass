# API 说明文档


## 根据用户名，查找关联密码记录
```
query UserPass($username: String!) {
  appPasswords(where: {user:{username: $username } }) {
      id
      pass_username
      pass_email
      pass_password
      pass_website

  }
}

{
  "username": "demo"

}
```