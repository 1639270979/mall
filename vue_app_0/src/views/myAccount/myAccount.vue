<template>
    <div class="account">
        <!-- 1:头部 -->
        <mt-header title="">
            <router-link to="/" slot="left">
                <mt-button icon="back">设置</mt-button>
            </router-link>
            <mt-button icon="more" slot="right"></mt-button>
        </mt-header>
        <!-- 头像  -->
        <div class="content-wrap">
            <router-link class="avatar" to="">
                <div>
                    <div>
                        <a href="javascript:;">
                            <img src="../../assets/img/family/timg.jpg" alt="">
                        </a>
                    </div>
                    <div>
                        <p class="name">肖春能</p>
                        <span>会员名：肖春能</span>
                    </div>
                </div>
                <div>
                    <span></span>
                    <span class="element-icons el-icon-arrow-right"></span>
                </div>
            </router-link>
            <!-- 我的拼团 -->
            <router-link to="" class="height border-bottom">
                <span>我的拼团</span>
                <span class="element-icons el-icon-arrow-right"></span>
            </router-link>
            <!-- 我的茶币 -->
            <router-link to="" class="height border-bottom">
                <span>我的茶币</span>
                <span class="element-icons el-icon-arrow-right"></span>
            </router-link>
            <!-- 我的收藏 -->
            <router-link to="" class="height border-bottom">
                <span>我的收藏</span>
                <span class="element-icons el-icon-arrow-right"></span>
            </router-link>
            <!-- 我的收获地址 -->
            <router-link to="" class="height bottom">
                <span>我的收获地址</span>
                <span class="element-icons el-icon-arrow-right"></span>
            </router-link>
            <!-- 账户安全 -->
            <router-link to="" class="height bottom">
                <span>账户与安全</span>
                <span class="element-icons el-icon-arrow-right"></span>
            </router-link>
            <!-- 优惠券 -->
            <router-link to="" class="height border-bottom">
                <span>优惠券</span>
                <span class="element-icons el-icon-arrow-right"></span>
            </router-link>
            <!-- 茶币商城 -->
            <router-link to="" class="height border-bottom bottom">
                <span>茶币商城</span>
                <span class="element-icons el-icon-arrow-right"></span>
            </router-link>
            <!-- 问题反馈 -->
            <router-link to="" class="height border-bottom">
                <span>问题反馈</span>
                <span class="element-icons el-icon-arrow-right"></span>
            </router-link>
            <!-- 加入茶师 -->
            <router-link to="" class="height border-bottom">
                <span>加入茶师</span>
                <span class="element-icons el-icon-arrow-right"></span>
            </router-link>
            <!-- 关于 -->
            <router-link to="" class="height">
                <span>关于</span>
                <span class="element-icons el-icon-arrow-right"></span>
            </router-link>
        </div>
        <!-- 退出当前账户 -->
        <div class="log-out">
            <button @click="quit">退出当前账户</button>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return {}
    },
    methods:{
        // 推出登陆
        quit(){
            this.$store.commit("updateCount",0);
            this.$store.commit("updateCart",0);
            this.$router.push("/");
        }
    }
}
</script>

<style scoped>
    .account .mint-header{
        background-color:#b0352f;
    }
    .account .mint-button--normal{
        line-height:21px;;
    }
    .content-wrap>a{
        display:block;
        background:#fff;
        padding:0 3vw;
        color:#000;
        font-size:.9rem;
        display:flex;
        justify-content:space-between;
        align-items:center;
    }
    .content-wrap>a.height{
        height:40px;
    }
    .content-wrap .bottom{
        margin-bottom:10px;
    }
    .content-wrap .border-bottom{
        border-bottom:1px solid #ddd;
    }
    .content-wrap .el-icon-arrow-right{
        display:inline-block;
        transform:scale(1.4);
    }
    /* 头像 */
    .avatar{
        height:70px;
        border-bottom:1px solid #ddd;
        margin-bottom:20px;
    } 
    .avatar>div:first-child{
        display:flex;
        justify-content:space-between;
        align-items:center;
    }
    .avatar>div:first-child a{
        display:block;
        width:60px;
        height:60px;
        line-height:60px;
        text-align:center;
        background:#ff6600;
        border-radius:50%;
        overflow:hidden;
        margin-right:5px;
    }
    .avatar>div:first-child p{
        font-size:1.1rem;
        font-weight:500;
        color:#000;
        margin:0;
        padding:0;
    }
    .avatar>div:first-child span{
        font-size:0.8rem;
        color:#666;
    }
    .avatar>div:first-child img{
        height:60px;
        width:60px;
    }
    .log-out{
        position:fixed;
        bottom:0;
        width:100%;
    }
    .log-out button{
        width:100%;
        height:45px;
        font-size:1rem;
        color:#fff;
        background-image: linear-gradient(to right, #b0352f, #b0352f);
    }
</style>