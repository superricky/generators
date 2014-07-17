#快递100文档说明

----
[1]:http://www.kuaidi100.com/openapi/api_post.shtml#d03 

**快递100的web API的文档在** 
**[快递100API文档][1]**

----
##1.配置说明

把`generators`文件夹放入`rails程序`的`lib文件夹`内，然后在`终端`进入rails程序`目录`

---
##2.使用说明

在终端输入
```
rails g kuaidi100 xxxx
```
`xxxx`是想创建的controller的名称

最后配置一下路径，默认添加的路径有两个
```
get 'xxxx/index'
post 'xxxx/show'
```

----
##3.示例
```
xxxx@xxxx:~/newapp$ rails g kuaidi100 webHome
       route  post 'web_home/show'
       route  get 'web_home/index'
      create  app/controllers/web_home_controller.rb
      create  app/views/web_home/index.html.haml
      create  app/views/web_home/show.html.haml
      create  app/helpers/web_home_helper.rb
xxxx@xxxx:~/newapp$ 

```

##4.Tips
> 修改接受信息方式在`controller.rb`中，添加物流公司在`helper.rb`中。

> 下面是基本要配置的信息

```
id:string         身份授权key
com:string        快递公司代码
nu:string         快递单号
valicode:string   忽略字段
show:string       返回类型: 0：返回json字符串，1：返回xml对象，2：返回html对象，
                           3：返回text文本。如果不填，默认返回json字符串。
muti:string       返回信息数量：1:返回多行完整的信息，0:只返回一行信息。
                              不填默认返回多行。
order:string       排序：desc：按时间由新到旧排列，asc：按时间由旧到新排列。
                              不填默认返回倒序（大小写不敏感）
```
