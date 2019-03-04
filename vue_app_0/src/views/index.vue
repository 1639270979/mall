<template>
    <div class="app-index">
        <!-- 1:头部 -->
        <div class="index-top">
            <!-- 头部地址定位 -->
            <div class="location-wrap">
                <div>
                <img class="icon-location" src="../assets/img/location.png" alt="">
                <span>定位</span>
                <img class="icon-arrow" src="../assets/img/right-arrow.png" alt="">
                </div>
            </div>
            <!-- 搜索 -->
            <div class="search-wrap">
                <div>
                <a href="">
                    <span class="mui-icon mui-icon-search"></span>
                    <span>搜索商家商品名称</span>
                </a>
                </div>
            </div>
        </div>
        <!-- 2主体 -->
        <div class="content-wrap">
            <!-- 2.1轮播图 -->
            <div class="slide-wrap" v-cloak>
                <mt-swipe :auto="4000">
                  <mt-swipe-item v-for="item in list" :key="item.id">
                      <router-link to="">
                        <img :src="item.img_url" alt="">
                      </router-link>
                  </mt-swipe-item>
                </mt-swipe>
            </div>
            <!-- 2.2导航 -->
            <div class="nav-list-wrap">
                <!-- 下 -->
                <div v-for="item in navs" :key="item.nid">
                    <router-link :to="item.url">
                        <div>
                            <img :src="item.img_url" alt="">
                        </div>
                        <span>{{item.title}}</span>
                    </router-link>
                </div>
            </div>
            <!-- 2.3今日特价 -->
            <div class="sale-wrap" v-cloak>
              <div class="recom-title">
                <span class="element-icons el-icon-xianshi"></span>
                今日特价
              </div>
              <!-- 特价商品 -->
              <div class="sale-box">
                <!-- 定时器 -->
                <div id="time">
                  距结束：
                  <span>{{t}}</span>
                </div>
                <div class="time-box" v-if="pris[0]">
                  <div>
                    <router-link to="">
                      <img :src="pris[0].img" alt="">
                    </router-link>
                  </div>
                  <div class="details">
                    <h3 >{{pris[0].title}}</h3>
                    <div class="price">
                      <del>¥{{pris[0].del}}</del>
                      <span>￥{{pris[0].price}}</span>
                    </div>
                    <div class="btn-box">
                      <span>仅剩{{pris[0].surplus}}</span>
                      <router-link to="">立即抢购</router-link>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- 2.4 推荐 -->
            <div class="recommened">
              <div class="recom-title">
                推荐
              </div>
              <div class="recom">
                <router-link to="" v-for="item of recom" :key="item.id">
                  <img :src="item.url_img" alt="">
                  <div>
                    <h3>{{item.title}}</h3>
                    <span>￥{{item.price.toFixed(2)}}</span>
                  </div>
                </router-link>
              </div>
            </div>
            <!-- 2.4拼团 -->
        </div>
    </div>
</template>

<script>

export default {
    data(){
    return {
      list:[],
      navs:[],
      recom:[],
      pris:[],
      t:0,
      // 开始与结束时间
      start:0,
      end:0
    }
  },
  components: {},
  methods:{
    //   1请求轮播图 https://test.dscmall.cn/   http://m.tea7.com/index.htm?comefrom=wap_bottom_nav
    getSlideImage(){
      // 发送ajax请求
      var url="http://127.0.0.1:3000/index/imageList"
      this.axios.get(url).then(result=>{
        this.list=result.data.data;
      })
    },
    // 2：请求导航列表
    getNavImage(){
        var url="http://127.0.0.1:3000/index/imageNav";
        this.axios.get(url).then(result=>{
            this.navs=result.data.data;
        })
    },
    // 3:获得推荐数据和获得特价商品
    getRecom(){
        var url="http://127.0.0.1:3000/index/getRecom";
        this.axios.get(url).then(result=>{
          this.recom=result.data.data.recom;
          this.pris=result.data.data.pris;
        })
    },
    // 
    //封装定时器函数
    timer(){
      var time=0;
      var task = function (){
        let start=new Date();
        let end=new Date("2019/4/5 00:00:00");
        let s=parseInt((end-start)/1000);
        if(s>0){
            //获取天数
            var d=parseInt(s/3600/24);
            if(d<10) d="0"+d;
            //获取小时
            var h=parseInt(s%(3600*24)/3600);
            if(h<10) h="0"+h;
            //获取分钟
            var m=parseInt(s%3600/60);
            if(m<10) m="0"+m;
            //获取秒
            var a=parseInt(s%60);
            if(a<10) a="0"+a;
            time=`${d}天${h}:${m}:${a}`;
        }
        else{
            time="活动结束";
            clearInterval(clock);
        }
      }
      var tasks=task.bind(this.timer);
      tasks();
      this.t=time;
      let clock=setInterval(()=>{
        tasks();
        this.t=time;
      },1000);
      // })();
    }
    
  },
  created() {
    this.getSlideImage();
    this.getNavImage();
    this.getRecom();
    this.timer();
  },
}

</script>

<style>
  [v-cloak]{display:none}
    /* 1:头部搜索框*/
  .app-index .index-top{
    width:100%;
    display:flex;
    z-index:999;
    justify-content:space-between;
    height:50px;
    position:fixed;
    top:0px;
    background-image: linear-gradient(to right, #b0352f, #b0352f);
    padding:10px;
  }
  .app-index .index-top .location-wrap{
    flex-shrink:0;
    font-family: Hiragino Sans GB, Arial, Helvetica, "\5B8B\4F53", sans-serif;
    font-size: 16px;
    color: #fff;
    align-items: center;
    max-width: 60vw;
    height:30px;
    line-height:30px;
    transition: 500ms;
    margin-right:5vw;
  }
  /* 图标大小 */
  .app-index .index-top .location-wrap .icon-location{
    width:15px;
    height:15px;
    margin-right:5px;
    vertical-align:baseline;
  }
  .app-index .index-top .location-wrap .icon-arrow{
    width:10px;
    height:10px;
  }
  /* 搜索框 */
  .app-index .index-top .search-wrap{
    width:100%;
    font-family: Hiragino Sans GB, Arial, Helvetica, "\5B8B\4F53", sans-serif;
    font-size: 16px;
    height:30px;
    line-height:30px;
    background-color: #f4f4f4;
    border-radius:100px;
  }
  .app-index .index-top .search-wrap span{
    margin-left:1vw;
    color:#999;
    font-size:14px;
  }
  .app-index .index-top .search-wrap .mui-icon-search{
    font-size:20px;
    margin-left:4vw;
    margin-top:3px;
    color:#222;
  }
  /* 2页面主体 */
  /* 2.1 轮播图*/
  .app-index .content-wrap{
      margin-top:14vw;
      padding-bottom:17vw;
  }
  .app-index .slide-wrap{
      width:100%;
      height:160px;
      overflow: hidden;
  }
  .app-index .slide-wrap a{
    display:inline-block;
    width:100%;
    height:100%;
  }
  .app-index .slide-wrap img{
      display:block;
      width:100%;
      height:100%;
  }
  .mint-swipe .mint-swipe-indicator{
      width:10px;
      height:10px;
      opacity:0.9;
      background:#fff;
  }
  .mint-swipe .mint-swipe-indicators .is-active{
      background:#ff2b41;
  }
   /* 2.2导航列表 */
   .app-index .nav-list-wrap{
       display:flex;
       justify-content:space-between;
       align-items:center;
       flex-wrap:wrap;
       text-align:center;
       background:#fff;
       padding:4vw 0;
       border-bottom:1px solid #ddd;
   }
  .app-index .nav-list-wrap>div{
    margin-top:2vh;
    width:20%;
  }
  .app-index .nav-list-wrap a{
    display:block;
    text-align:center;
    font-size:13px;
    color:#333;
  }
  /* 图片大小 */
  .app-index .nav-list-wrap a img{
    width:10vw;
    height:10vw;
  }
  /* 特价 */
  .app-index .el-icon-xianshi{
    display:inline-block;
    transform:scale(1.5);
    color: #b94c47;
    margin-right:4px;
    font-weight:600;
  }
  .app-index .sale-wrap{
    background:#fff;
    padding:2.5vw;
  }
  .app-index .sale-wrap #time{
    height:10vw;
    line-height:10vw;
    color:#333;
    margin-bottom:2vw;
  }
  .app-index .sale-wrap #time span{
    display:inline-block;
    width:32vw;
    height:8vw;
    text-align:center;
    line-height:8vw;
    border-radius:4px;
    border:1px solid #b94c47;
  }
  .app-index .time-box{
    display:flex;
    justify-content:space-between;
    padding:2.5vw;
    background:#f6f6f6;
  }
  .app-index .time-box>div>a{
    display:block;
    width:26vw;
    height:26vw;
  }
  .app-index .time-box>div img{
    width:26vw;
    height:100%;
  }
  /* 3.1详情 */
  .app-index .details{
    text-align:right;
    width:70vw;
    padding:2vw;
  }
  .app-index .details h3{
    font-size:1rem;
    color:#333;
    margin-bottom:3vw;
  }
  /* price */
  .app-index .price{
    color:#666;
    font-size:0.9rem;
    margin-bottom:3vw;
  }
  .app-index .price span{
    font-size:1rem;
    color: #b94c47;
    margin-left:6px;
  }
  /* 立即购买按钮 */
  .app-index .btn-box span{
    font-size:0.9rem;
    color:#666;
    margin-right:2vw;
  }
  .app-index .btn-box a{
    display:inline-block;
    width:22vw;
    height:8vw;
    text-align:center;
    line-height:8vw;
    background: #ffde00;
    border-radius: 5px;
    color:#333;
  }
  /* 4：推荐 */
  .app-index .recommened{
    background:#fff;
    padding-bottom:1vw;
  }
  /* 猜你喜欢 */
  .app-index .recom-title{
      color:#333;
      font-size:1.1rem;
      height:10.375vw;
      line-height:10.375vw;
      text-align:center;
      display:flex;
      justify-content:center;
      align-items: center;
      margin-top:5vw;
      margin-top:3vw;
  }
  .app-index .recom-title:before{
      content:'';
      display:block;
      width:2vw;
      height:2vw;
      border-radius:50%;
      background: #d4c0a7;
      margin-right:3vw;
  }
  .app-index .recom-title:after{
      content:'';
      display:block;
      width:2vw;
      height:2vw;
      border-radius:50%;
      background: #d4c0a7;
      margin-left:3vw;
  }
  .app-index .recom{
    display:flex;
    justify-content: space-between;
    flex-wrap:wrap;
    padding:0 2vw;
  }
  .app-index .recom>a{
    display:block;
    width:49%;
    padding-bottom:2vw;
  }
  .app-index .recom>a>div{
    width:100%;
    color:#fff;
  }
  .app-index .recom>a>div h3{
    font-size:0.95rem;
    height:21px;
    width:97%;
    font-weight:500;
    line-height:21px;
    color:#333;
    overflow: hidden;
    padding:0;
    margin:0;
    margin-bottom:1vw;
  }
  .app-index .recom>a>div span{
    font-size: 1.2rem;
    font-weight:400;
    display:block;
    color:#b0352f;
    letter-spacing: 1px;
    padding:0;
    margin:0;
    overflow: hidden;
  }
  .app-index .recom>a img{
    width:100%;
  }
  
</style>