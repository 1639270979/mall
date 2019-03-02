//1：加载模块
const express=require("express");
const router=express.Router();
const pool=require("../pool");

// 验证用户是否存在
router.get('/verify',(req,res)=>{
    var phone=req.query.phone;
    // 查询用户是否存在
    var sql="SELECT * FROM mall_user WHERE phone=?";
    pool.query(sql,[phone],(err,result)=>{
        if(err) console.log(err);
        if(result.length>0){
            res.send({code:1,msg:"账号可用"});
        }else{
            res.send({code:-1,msg:"账号不可用"});
        }
    })
})
// 注册
router.get('/register',(req,res)=>{
    var phone=req.query.phone;
    var upwd=req.query.upwd;
    var email=req.query.email;
    var sql="INSERT INTO mall_user VALUES(null,'',?,?,?)";
    pool.query(sql,[phone,upwd,email],(err,result)=>{
        if(err) console.log(err);
        if(result.affectedRows>0){
            res.send({code:1,msg:"注册成功"})
        }else{
            res.send({code:-1,msg:"注册失败"});
        }
    })
})
// 1：用户登录
router.get('/login',(req,res)=>{
    var u = req.query.phone;
    var p = req.query.upwd;
    var sql="SELECT id FROM mall_user WHERE phone=? AND upwd=?";
    pool.query(sql,[u,p],(err,result)=>{
        if(err) console.log(err);
        if(result.length>0){
            res.send({code:1,data:result});
            // var id = result[0].id;
        }else{
            res.send({code:-1,msg:"登录失败"});
        }
    })
});
// 2:购物车列表
router.get('/cartList',(req,res)=>{
    var uid=req.query.id;
    var sql="SELECT * FROM mall_cart WHERE uid=?";
    pool.query(sql,[uid],(err,result)=>{
        if(err) console.log(err);
        if(result.length>0){
            res.send({code:1,data:result});
        }else{
            console.log("未登录");
            res.send({code:-1,data:"登录失败"});
        }
    })
})

// 导出
module.exports=router;