//1：加载模块
const express=require("express");
const router=express.Router();
const pool=require("../pool");
//功能一:home 组件轮播图片
router.get("/imageList",(req,res)=>{
    //1:将轮播图中所需图片 复制public/img
    //2:查询
    var sql="SELECT * FROM mall_slide";
    pool.query(sql,[],(err,result)=>{
      if(err) console.log(err);
      res.send({
       code:1,data:result
      }); 
    })
 });
 //功能二 导航列表
 router.get('/imageNav',(req,res)=>{
   var sql = "SELECT * FROM mall_nav";
   pool.query(sql,[],(err,result)=>{
     if(err) console.log(err);
     res.send({
       code:1,data:result
     });
   })
 });
//  功能三 推荐列表
router.get('/getRecom',(req,res)=>{
  var output = {recom:[],pris:[]};
  var sql="SELECT * FROM mall_recommened";
  pool.query(sql,[],(err,result)=>{
    if(err) console.log(err);
    if(result.length>0){
      output.recom=result;
      var sql="SELECT * FROM mall_group";
      pool.query(sql,[],(err,result)=>{
        if(err) console.log(err);
        if(result.length>0){
          output.pris=result;
          res.send({code:1,data:output});
        }
      })
    }else{
      res.send({code:-1,msg:"not"});
    }
  })
})
//功能四 获得自饮茶数据
router.get('/getData',(req,res)=>{
  var out = {
    classify:[],
    hot:[],
    rem:[]
  } 
  var sql = "SELECT * FROM mall_classify";
  pool.query(sql,[],(err,result)=>{
    if(err) console.log(err);
    if(result.length>0){
      out.classify=result;
      var sql= "SELECT * FROM mall_hot";
      pool.query(sql,[],(err,result)=>{
        if(err) console.log(err);
        if(result.length>0){
          out.hot=result;
          var sql = "SELECT * FROM mall_rem";
          pool.query(sql,[],(err,result)=>{
            if(err) console.log(err);
            if(result.length>0){
              out.rem=result;
              res.send({code:1,data:out});
            }
          })
        }
      })
    }
  })
})
// 功能五
router.get('/getDet',(req,res)=>{
  var output = {
    slide:[],
    detail:[],
    pics:[]
  }
  var id = req.query.tid;
  var sql = "SELECT * FROM mall_teas WHERE tid=?";
  pool.query(sql,[id],(err,result)=>{
    if(err) console.log(err);
    if(result.length>0){
      output.detail=result;
      var sql="SELECT * FROM mall_teas_pic WHERE tid=?";
      pool.query(sql,[id],(err,result)=>{
        if(err) console.log(err);
        if(result.length>0){
          output.slide=result;
          var sql="SELECT * FROM mall_details_pic WHERE tid=?";
          pool.query(sql,[id],(err,result)=>{
            if(err) console.log(err);
            if(result.length>0){
              output.pics=result;
              res.send({code:1,data:output});
            }
          })
        }
      })
    }
  })
})

module.exports=router;