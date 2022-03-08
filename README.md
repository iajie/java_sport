# java_sport

### 介绍
**个人运动管理平台**
使用微信小程序获取微信运动接口数据进行的统计平台，食物模块更详细的展示食物营养成分，帮助提高个人对健康的认识。
bilibili地址[bilibili地址](https://www.bilibili.com/video/BV1Mq4y1W747?p=4)

### 项目架构
![输入图片说明](https://images.gitee.com/uploads/images/2022/0303/233742_bb06844c_8886246.png "屏幕截图.png")

### 环境准备
```bash
JDK >= 1.8 (推荐1.8版本)
Mysql >= 5.7.0 (推荐5.7版本)
Redis >= 3.0
Maven >= 3.0
Node >= 8.0
```
### 后端运行
> 下载项目到本地后建议把wx_sport和vue_sport移动和java_sport同级，如果端口冲突请自行修改端口号，酷狗音乐下载端口和本端口一致

1. 导入到IDEA，菜单 File -> Open，建议加载自己本地的maven仓库
2. 创建数据库sport并在java_sport/tool下导入数据脚本sport.sql
3. 添加application.yml的七牛云配置accessKey、secretKey、bucket
4. 如果需要使用阿里云短信请申请后配置accessKey、secretKey、signName、templateCode
5. 设置自己的微信小程序appid、secret
```yml
# 配置七牛云
qiniu:
  accessKey:
  secretKey:
  bucket:
# 配置阿里云短信服务
aliyun:
  # ak
  accessKey:
  # sk
  secretKey:
  # 签名
  signName:
  # 短信模板
  templateCode:
# 微信小程序
mini:
  # 密钥
  appid:
  secret:
```
6. 更改application-dev.yml的mysql数据库密码，邮件的发件人以及自己的授权码
![输入图片说明](https://images.gitee.com/uploads/images/2022/0304/000922_f12235f4_8886246.png "屏幕截图.png")
### 前端运行
```bash
# 安装依赖
npm install

# 建议不要用直接使用 cnpm 安装
npm install --registry=https://registry.npm.taobao.org

# 进入main.js配置自己的七牛云域名
Vue.prototype.$qiniu = 'http://xxx.xxx/';

# 本地开发 启动项目
npm run serve
```
打开浏览器，输入：(http://localhost) 账号/密码 admin/123456）

### 微信小程序运行
> 首先进入[https://mp.weixin.qq.com/](https://mp.weixin.qq.com/)注册微信小程序账号获取到appid和secret

1. 打开微信开发者工具讲wx_sport导入，在调试器中点击终端
2. 新建终端npm install
3. 左上角工具-->构建 npm
4. 右上角详情-->本地设置-->勾上不校验合法域名、web-view(业务域名)、TLS版本以及HTTPS证书

## 部署
  _**详情见tool/Sport部署笔记.pdf** _ 

# 欢迎进群讨论
![输入图片说明](https://images.gitee.com/uploads/images/2022/0304/001854_a5b707a4_8886246.png "屏幕截图.png")