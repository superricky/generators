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
