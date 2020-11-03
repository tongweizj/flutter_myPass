# myPass.app

## Roadmap/TODOs

* [x] v0.1 FrontPage
* [ ] v0.2 User
  * [x] Login Page
  * [x] Index
  * [x] Home Page
  * [ ] Regrister Page
* [ ] v0.3 Password detail / Add / Edit Page

## 技术架构
<img src="/doc/img/technology_architecture.png" width="900px"/> 

## 产品设计稿
<img src="/doc/img/v02.png" width="900px"/> 

1. 判断，是否登录，登录就直接进入首页
2. 登录，


## 页面逻辑

### Home Page

1. api 获取密码list
2. 显示list

## 文件目录规则

### /ui/views/widgets

widgets 分成两类：

* 仅在某个页面出现： 放在以这个页面命名的文件中，例如 home_page_widgets.dart
* 在多个页面复用：以这个组件名字命名，例如 appbar_widgets.dart

#### widget命名规则

* Block  区块，包含一个以上的组件，例如 buildPassItemBlock，指一个密码信息块  
* Item   单个组件
* Btn    按钮
* 