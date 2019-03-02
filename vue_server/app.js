//app.js
//1:加载模块 express pool.js
const express = require("express");
//引入中间件bodyparse
const bodyParser=require("body-parser");
const pool = require("./pool");
//1.1引入路由
const index = require("./routes/index.js");
const cart = require("./routes/cart.js");
//2:创建服务器端对象
var app = express();
//3:监听 3000
app.listen(3000);
//4:指定静态目录  public 
app.use(express.static("public"));
//5:加载跨域访问模块
const cors = require("cors");
//6:配置跨域访问的模块  配置哪个域名跨域是允许的  脚手架8080 允许
//crdentials 跨域访问保存session 的id
//7:配置cors
app.use(cors({
  origin:["http://127.0.0.1:8080",
         "http://localhost:8080"],//允许列表
  credentials:true   //是否验证
}))
//7.1 下载 exqresss-session 并且配置
const session = require("express-session");
app.use(session({
  secret:"henqi",//安全字符串
  resave:false,         //每次请求是否都保存更新数据  不用更新
  saveUninitialized:true, //初始化时保存数据
  cookie:{
    maxAge:1000*60*60*8
  }
}))
//8:引入bodyParser中间件将post请求数据解析为对象，一定要写在路由的前面
app.use(bodyParser.urlencoded({extended:false}));
//
//9:将/index路由器挂载到index下
app.use('/index',index);//index/
// 将/cart路由器挂载到cart下
app.use('/cart',cart);


