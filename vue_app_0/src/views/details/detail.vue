<template>  
    <div class="app-det">
        <!-- 头部 -->
        <mt-header class="det-header" title="商品详情">
            <router-link to="/drink_tea" slot="left">
                <mt-button icon="back"></mt-button>
            </router-link>
            <router-link to="" slot="right">
                <mt-button></mt-button>
            </router-link>
        </mt-header>
        <!-- 2：详情 -->
        <div class="det-content">
            <!-- 2.1轮播图 -->
            <div class="slide-wrap" v-cloak v-if="slide">
                <mt-swipe :auto="6000">
                  <mt-swipe-item v-for="item in slide" :key="item.id">
                      <router-link to="">
                        <img :src="item.img_url" alt="">
                      </router-link>
                  </mt-swipe-item>
                </mt-swipe>
            </div>
            <!-- 2.2 详情 -->
            <div class="detail-box">
                <div class="title">
                    <h3>{{detail.title}}</h3>
                    <div class="details">{{detail.details}}</div>
                    <div class="price">
                        <span>￥</span>    
                        {{detail.price}}
                    </div>
                    <p>价格
                        <del>218</del>
                    </p>
                </div>
            </div>
            <!-- 2.3 茶币 -->
            <div class="coin-box">
                <div class="coin">
                    <span>茶币</span>
                    <span>
                        买就赠送
                        <b>{{detail.coin}}</b>
                        茶币
                    </span>
                </div>
                <div class="serve">
                    <span>服务</span>
                    <div>
                        <span>
                            <i class="element-icons el-icon-zhengque1"></i>
                            满99元包邮
                        </span>
                        <span>
                            <i class="element-icons el-icon-zhengque1"></i>48小时发货
                        </span>
                    </div>
                </div>
            </div>
            <!-- 2.4详情图片 -->
            <div class="pic-wrap">
                <div class="pic-detail">商品详情</div>
                <div class="pic">
                    <div v-for="item of pics" :key="item.id">
                        <img :src="item.img_url" alt="">
                    </div>
                </div>
            </div>
        </div>
        <!-- 3:底部加入购物车 -->
        <div class="shopcart">
            <router-link to="">
                <i class="element-icons el-icon-kefu1"></i>
                <span>客服</span>
            </router-link>
            <router-link to="">
                <i class="mui-icon mui-icon-extra mui-icon-extra-cart"></i>
                <span>购物车</span>
            </router-link>
            <router-link to="">
                <i class="mui-icon mui-icon-star"></i>
                <span>收藏</span>
            </router-link>
            <button class="addCart">加入购物车</button>
            <button class="buy">立即购买</button>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return {
            slide:[],
            detail:[],
            pics:[]
        }
    },
    methods:{
        // 获得数据
        getDet(){
            var tid = this.$route.query.tid;
            var url = "http://127.0.0.1:3000/index/getDet?tid="+tid;
            this.axios.get(url).then(result=>{
                this.slide=result.data.data.slide;
                this.detail=result.data.data.detail[0];
                this.pics=result.data.data.pics;
            })
        }
    },
    created(){
        this.getDet();
    }
}
</script>

<style>
    /* 1:头部 */
    .app-det .det-header{
        height:12vw;
        background:#b0352f;
        font-size:1.1rem;
        position:fixed;
        top:0;
        z-index:999;
        width:100%;
    }
    .app-det .det-content{
        padding-bottom:16vw;
    }
    /* 轮播图 */
    .app-det .slide-wrap{
      width:100%;
      height:100vw;
      overflow: hidden;
      border-bottom:1px solid #ddd;
    }
    .app-det .slide-wrap a{
        display:inline-block;
        width:100%;
        height:100%;
    }
    .app-det .slide-wrap img{
        display:block;
        width:100%;
        height:100%;
    }
    .app-det .mint-swipe-indicator{
        width:10px;
        height:10px;
        opacity:0.9;
        background:#fff;
    }
    .mint-swipe .mint-swipe-indicators .is-active{
        background:#ff2b41;
    }
    /* 详情 */
    .app-det .detail-box{
        padding:2.5vw;
        background:#fff;
    }
    .app-det .detail-box h3{
        font-size: 1.2rem;
        color:#333;
        max-height:14vw;
        line-height: 1.4;
    }
    .app-det .detail-box .details{
        font-size: 1rem;
        color:#666;
    }
    .app-det .detail-box .price{
        font-size: 1.5rem;
        color:#ff5000;
        margin-top:2vw;
        margin-bottom:1vw;
    }
    .app-det .detail-box .price span{
        font-size: 1rem;
    }
    .app-det .detail-box p{
        margin:0;
    }
    /* 茶币 */
    .app-det .coin-box{
        background:#fff;
        padding:0 2.5vw;
        margin-top:2vw;
    }
    .app-det .coin-box .coin{
        border-bottom:1px solid #ddd;
        height:12vw;
        line-height: 12vw;
        font-size: 0.9rem;
        color:#333;
    }
    .app-det .coin-box .coin span:last-child{
        margin-left:5vw;
    }
    .app-det .coin-box .serve{
        display:flex;
        justify-content: space-between;
        height:12vw;
        line-height: 12vw;
        font-size: 0.9rem;
        color:#333;
    }
    .app-det .coin-box .serve>div{
        width:85%;
    }
    .app-det .pic-wrap{
        margin-top:2vw;
        background:#fff;
    }
    .app-det .pic-wrap .pic-detail{
        height:12vw;
        font-size:1rem;
        line-height:12vw;
        color:#b0352f;
        padding:0 2.5vw;
    }
    .app-det .pic-wrap .pic{
        width:100%;
    }
    .app-det .pic-wrap .pic img{
        width:100%;
    }
    .app-det .shopcart{
        height:13vw;
        display:flex;
        justify-content:space-between;
        align-items:center;
        position:fixed;
        bottom:13vw;
    }
    .app-det .shopcart a{
        display:block;
        width:15vw;
        font-size:0.9rem;
        color:#999;
        background:#fff;
        z-index:999;
        text-align:center;
    }
    .app-det .shopcart a i{
        display:block;
    }
    .app-det .shopcart button{
        width:27.5vw;
        height:100%;
        border:0;
        color:#fff;
        font-weight:500;
        letter-spacing:2px;
    }
    .app-det .shopcart .addCart{
        border-right:0;
        background: #FF9500;
    }
    .app-det .shopcart .buy{
        background: #DD2727;
    }
</style>