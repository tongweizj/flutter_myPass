# API 说明文档

## 安全
### 1.1 获取Token

#### API说明

#### URL
#### 请求参数
``` JSON
{
  "email": "eve@luci.ai",
  "action": "TokenRequest"
}
```
#### 返回参数
``` JSON
{
  "email": "eve@luci.ai",
  "token": "e98d881e-4679-487b-8cbb-462ad48d31f4",
  "expires": 1593107120222
}
```
## 1. 用户相关接口

### 1.1 用户注册
#### API说明

#### URL

``` bash
http://api.mypass.yoese.com/v1/users/sign_up
``` 
#### Post请求参数

``` JSON
{
  "username":"mike",
  "email":"mike@mike.com",
  "password":"xxxxxxxx",
  "token":"mike@mike.com",
}
```

#### 返回参数

``` JSON
{
  "code": 200,
  "message": "",
  "data": ""
}
```

### 1.2 用户登录
#### API说明

#### URL

``` bash
http://api.mypass.yoese.com/v1/users/login
``` 
#### 请求参数
``` JSON
{
	"password": "7b22757365726e616d65223a2264656d6f222c2270617373776f7264223a225a4756746232526c6257383d227d",
	"token": "",
	"action": "login"
}
```
#### 返回参数
``` JSON
{
  "code": 200,
  "message": "",
  "data": ""
}
```

## 接口说明模板

### 1.2 xxx接口
#### API说明
#### URL
#### 请求参数
``` JSON
{

}
```
#### 返回参数
``` JSON
{
    
}
```