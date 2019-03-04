<template>  
    <div class="family">
        <!-- 1:头部 -->
        <mt-header title="我的">
            <router-link to="/" slot="left">
                <mt-button icon="back"></mt-button>
            </router-link>
            <mt-button icon="more" slot="right"></mt-button>
        </mt-header>
        <!-- 2:基本信息 -->
        <section>
            <div class="info">
                <div class="info-img"></div>
                <div class="info-name">
                    <h3>462c8b663</h3>
                    <span class="element-icons el-icon-shouji1"></span>
                    <span>188****0243</span>
                </div>
                <span class="element-icons el-icon-arrow-right" @click="myAccount"></span>
            </div>
        </section>
        <!-- 3:我的订单 -->
        <section class="order-wrap">
            <div class="order-state">
                <div>
                    <span>我的订单</span>
                    <p>
                        <span>查看全部订单</span>
                        <span class="element-icons el-icon-arrow-right"></span>
                    </p>
                </div>
                <div>
                    <a href="javascript:;">
                        <div>
                            <img src="../assets/img/family/buy.webp" alt="">
                        </div>
                        <span>待付款</span>
                    </a>
                    <a href="javascript:;">
                        <div>
                            <img src="../assets/img/family/fahuo.webp" alt="">
                        </div>
                        <span>待发货</span>
                    </a>
                    <a href="javascript:;">
                        <div>
                            <img src="../assets/img/family/shouhuo.png_.webp" alt="">
                        </div>
                        <span>待收货</span>
                    </a>
                    <a href="javascript:;">
                        <div>
                            <img src="../assets/img/family/pinjia.webp" alt="">
                        </div>
                        <span>评价</span>
                    </a>
                    <a href="javascript:;">
                        <div>
                            <img src="../assets/img/family/shouhou.webp" alt="">
                        </div>
                        <span>售后</span>
                    </a>
                </div>
            </div>    
        </section> 
        <!-- 4:必备工具 -->
        <section class="tool-wrap">
            <div class="tool-state">
                <div>
                    <span>必备工具</span>
                    <p>
                        <span>查看全部工具</span>
                        <span class="element-icons el-icon-arrow-right"></span>
                    </p>
                </div>
                <div>
                    <a href="javascript:;">
                        <div>
                            <img src="../assets/img/family/tool1.webp" alt="">
                        </div>
                        <span>野生小伙伴</span>
                    </a>
                    <a href="javascript:;">
                        <div>
                            <img src="../assets/img/family/tool2.png" alt="">
                        </div>
                        <span>领卷中心</span>
                    </a>
                    <a href="javascript:;">
                        <div>
                            <img src="../assets/img/family/tool3.png" alt="">
                        </div>
                        <span>置换闲钱</span>
                    </a>
                    <a href="javascript:;">
                        <div>
                            <img src="../assets/img/family/tool4.png" alt="">
                        </div>
                        <span>客服小蜜</span>
                    </a>
                    <a href="javascript:;">
                        <div>
                            <img src="../assets/img/family/tool5.webp" alt="">
                        </div>
                        <span>阿里宝卡</span>
                    </a>
                    <a href="javascript:;">
                        <div>
                            <img src="../assets/img/family/tool6.webp" alt="">
                        </div>
                        <span>我的评价</span>
                    </a>
                    <a href="javascript:;">
                        <div>
                            <img src="../assets/img/family/tool7.webp" alt="">
                        </div>
                        <span>主题换肤</span>
                    </a>
                    <a href="javascript:;">
                        <div>
                            <img src="../assets/img/family/tool8.webp" alt="">
                        </div>
                        <span>更多</span>
                    </a>
                </div>
            </div>    
        </section>    
    </div>
</template>

<script>
export default {
    data(){
        return {}
    },
    methods:{
        myAccount(){
            this.$router.push("/myAccount");
        }
    }
}
</script>

<style scoped>
    .family p{
        margin:0;
        padding:0;
    }
    /* 1：头部 */
    .family .mint-header{
        height:13vw;
        background:#fff;
        color:#333;
    }
    .family .mint-header .mint-header-title{
        height:5vw;
        margin:0;
        padding:0;
        line-height: 5vw;
        font-size:1.1rem;
        letter-spacing: 2px;
    }
    /* 2：个人基本信息  */
    .family .info{
        height:28vw;
        padding:0 4vw;
        display:flex;
        justify-content: space-between;
        align-items: center;
        /* background: url("../assets/img/family/bg.png"); */
        background-image: linear-gradient(to right, #FD9126, #FF5000);
        background-size:100%;
    }
    .family .info .info-img{
        width:16vw;
        height:16vw;
        border-radius:50%;
        background:#ddd;
    }
    .family .info .info-name{
        width:65vw;
        margin-left:5vw;
    }
    .family .info .info-name h3{
        color:#fff;
        font-weight:600;
        font-size:1.4rem;
    }
    .family .info .info-name span{
        color:#fff;
        font-size:0.8rem;
    }
    .family .info>span{
        color:#fff;
        display:inline-block;
        transform: scale(1.4)
    }
    /* 3：我的订单 */
    
    .family .order-wrap{
        padding:0 3vw;
        margin-top:6vw;
        background:#fafafa;
    }
    .family .order-state>div{
        display:flex;
        justify-content: space-between;
        align-items: center;
        padding:0 2vw;
    }
    .family .order-state>div:first-child{
        height:10vw;
    }
    .family .order-state>div:last-child{
        padding:2vw;
    }
    .family .order-state>div:last-child img{
        width:29px;
        height:29px;
    }
    .family .order-state>div:last-child a{
        display: inline-block;
        width:20%;
        text-align: center;
        font-size: 0.8rem;
        color:#666;
        font-weight:500;
    }
    /* 3：我的工具 */
    .family .tool-wrap{
        padding:0 3vw;
        margin-top:4vw;
        background:#fafafa;
    }
    .family .tool-state>div{
        display:flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap:wrap;
        padding:0 2vw;
    }
    .family .tool-state>div:first-child{
        height:10vw;
    }
    .family .tool-state>div:last-child{
        padding:2vw;
    }
    .family .tool-state>div:last-child img{
        width:29px;
        height:29px;
    }
    .family .tool-state>div:last-child a{
        display: inline-block;
        width:25%;
        text-align: center;
        font-size: 0.8rem;
        color:#666;
        font-weight:500;
        margin-bottom:4vw;
    }
</style>